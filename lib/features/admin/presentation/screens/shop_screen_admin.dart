import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/shops/data/models/sub_models.dart/market_sub_item_model.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_state.dart';

class ShopScreenAdmin extends StatelessWidget {
  ShopScreenAdmin({Key? key, this.marketList, required this.onViewShop})
      : super(key: key);

  List<MarketSubItemModel>? marketList;
  final Function(int) onViewShop;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is CreateMarketSuccessfully ||
            state is UpdateMarketSuccessfully ||
            state is DeleteMarketSuccessfully) {
          context.read<MarketsCubit>().eitherFailureOrMarktes();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: BlocBuilder<MarketsCubit, MarketsState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 1000,
                        height: 2000,
                        child: DataTable(
                          columnSpacing: 20,
                          columns: const [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Location')),
                            DataColumn(label: Text('Description')),
                            DataColumn(label: Text('Image')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List.generate(marketList!.length, (index) {
                            final shop = marketList![index];
                            return DataRow(
                              cells: [
                                DataCell(Text(shop.name)),
                                DataCell(Text(shop.location)),
                                DataCell(
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(shop.description),
                                  ),
                                ),
                                DataCell(
                                  shop.image != null
                                      ? marketImage(shop)
                                      : const Icon(Icons.image,
                                          size: 50, color: Colors.grey),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.visibility,
                                            color: Colors.green),
                                        onPressed: () {
                                          context
                                              .read<GetProductsCubit>()
                                              .eitherFailureOrGetProducts(
                                                  shop.id);
                                          onViewShop(shop.id);
                                        },
                                        tooltip: 'View Products',
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (dialogContext) =>
                                                  BlocProvider.value(
                                                    value: context
                                                        .read<AdminCubit>(),
                                                    child: ShopDialog(
                                                      update: true,
                                                      onPressed: () {
                                                        if (context
                                                            .read<AdminCubit>()
                                                            .formMarketKey
                                                            .currentState!
                                                            .validate()) {
                                                          {
                                                            context
                                                                .read<
                                                                    AdminCubit>()
                                                                .eitherFailureOrUpdateMarket(
                                                                    shop.id);
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        }
                                                      },
                                                      shop: shop,
                                                    ),
                                                  ));
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          context
                                              .read<AdminCubit>()
                                              .eitherFailureOrDeleteMarket(
                                                  shop.id);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (dialogContext) => BlocProvider.value(
                            value: context.read<AdminCubit>(),
                            child: ShopDialog(
                              update: false,
                              onPressed: () {
                                if (context
                                    .read<AdminCubit>()
                                    .formMarketKey
                                    .currentState!
                                    .validate()) {
                                  {
                                    context
                                        .read<AdminCubit>()
                                        .eitherFailureOrCreateMarket();
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Shop'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ShopDialog extends StatelessWidget {
  ShopDialog({
    super.key,
    required this.update,
    required this.onPressed,
    this.shop,
  });

  bool update;
  MarketSubItemModel? shop;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 450,
        height: 450,
        child: AlertDialog(
          title: Text(update ? "Update Shop" : "Add New Shop"),
          content: SingleChildScrollView(
            child: Form(
              key: context.read<AdminCubit>().formMarketKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: context.read<AdminCubit>().nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name must be between 3 and 20 characters.";
                      }
                      if (value.length < 3 || value.length > 20) {
                        return "Name must be between 3 and 20 characters.";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Shop Name'),
                  ),
                  TextFormField(
                    controller:
                        context.read<AdminCubit>().descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description must be between 3 and 20 characters.";
                      }
                      if (value.length < 3 || value.length > 20) {
                        return "Description must be between 3 and 20 characters.";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  TextFormField(
                    controller: context.read<AdminCubit>().locationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Location must be between 3 and 20 characters.";
                      }
                      if (value.length < 3 || value.length > 20) {
                        return "Location must be between 3 and 20 characters.";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Location'),
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.read<AdminCubit>().startWebFilePicker(),
                    child: BlocBuilder<AdminCubit, AdminState>(
                      builder: (context, state) {
                        return CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              context.read<AdminCubit>().selectedFile != null
                                  ? MemoryImage(
                                          context.read<AdminCubit>().bytesData!)
                                      as ImageProvider
                                  : null,
                          child: context.read<AdminCubit>().selectedFile == null
                              ? const Icon(Icons.camera_alt,
                                  size: 20, color: primaryColor)
                              : null,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(update ? "Update" : "Add"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget marketImage(MarketSubItemModel shop) {
  String? image = shop.image;
  return Container(
    padding:const  EdgeInsets.symmetric(vertical: 5),
    child: Image.network(
    image!,
    height: 50,
    width: 50,
    fit: BoxFit.cover,
  ),);
}
