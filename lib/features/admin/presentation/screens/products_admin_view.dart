// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';

import 'package:order_app/core/models/products_model.dart';

import 'package:order_app/core/models/sub_models/product_model_of_resturant_with_image.dart';

import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_cubit.dart';
import 'package:order_app/features/products/presentation/cubit/get_product_details_state.dart';

class ProductsAdminView extends StatelessWidget {
  final VoidCallback onBack;
  ProductsAdminView({Key? key, required this.onBack, this.productsModel})
      : super(key: key);

  ProductsModel? productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is CreateProductSuccessfully ||
            state is UpdateProductSuccessfully ||
            state is DeleteProductSuccessfully) {
          context.read<GetProductsCubit>().eitherFailureOrGetProducts(productsModel!.marketSubItemModel.id);
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
                child: BlocBuilder<GetProductsCubit, GetProductsState>(
                  builder: (context, state) {
                    return DataTable(
                      columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Price')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('quantity')),
                        DataColumn(label: Text('Actions')),
                        DataColumn(label: Text('Image')),
                      ],
                      rows: List.generate(
                          productsModel!.listOfProduct!.listOfProduct.length,
                          (index) {
                        final product =
                            productsModel?.listOfProduct!.listOfProduct[index];
                        return DataRow(
                          cells: [
                            DataCell(
                                Text(product!.productModelOfResturant.name)),
                            DataCell(Text(
                                '\$${product.productModelOfResturant.price.toStringAsFixed(2)}')),
                            DataCell(SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                  product.productModelOfResturant.descrption),
                            )),
                            DataCell(Text(
                                "${product.productModelOfResturant.availableQuantity}")),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (dialogContext) =>
                                              BlocProvider.value(
                                                value:
                                                    context.read<AdminCubit>(),
                                                child: ProductDialog(
                                                    update: true,
                                                    product: product),
                                              ));
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      context
                                          .read<AdminCubit>()
                                          .eitherFailureOrDeleteProduct(product
                                              .productModelOfResturant.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              product.image != null
                                  ? productImage(product)
                                  : const Icon(Icons.image,
                                      size: 50, color: Colors.grey),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (dialogContext) => BlocProvider.value(
                          value: context.read<AdminCubit>(),
                          child: ProductDialog(
                            update: false,
                            id: productsModel!.marketSubItemModel.id,
                          ),
                        ));
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New Product'),
            ),
            TextButton(
              onPressed: onBack,
              child: const Text('Back to Shops'),
            ),
          ],
        );
      },
    );
  }
}

class ProductDialog extends StatelessWidget {
  ProductDialog({super.key, required this.update, this.product, this.id});

  bool update;
  ProductModelOfResturantWithImage? product;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 450,
        height: 450,
        child: AlertDialog(
          title: Text(update ? "update New product" : "Add New product"),
          content: SingleChildScrollView(
            child: Form(
              key: context.read<AdminCubit>().formKeyProductKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                      controller: context.read<AdminCubit>().nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name must be between 3 and 20 characters.";
                        }
                        if (value.length < 3 || value.length > 20) {
                          return "name must be between 3 and 20 characters.";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Product Name')),
                  TextFormField(
                      controller:
                          context.read<AdminCubit>().descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description must be between 3 and 200 characters.";
                        }
                        if (value.length < 3 || value.length > 20) {
                          return "Description must be between 3 and 200 characters.";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Description')),
                  TextFormField(
                      controller: context
                          .read<AdminCubit>()
                          .availableQuantityController,
                      validator: (value) {
                        if (value == null) {
                          return "input required";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "input must number";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'availableQuantity')),
                  TextFormField(
                      controller: context.read<AdminCubit>().priceController,
                      validator: (value) {
                        if (value == null) {
                          return "input required";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "input must number";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'price')),
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
                child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                validateThenDoProduct(context, update, product, id);
              },
              child: Text(update ? "Update" : "Add"),
            ),
          ],
        ),
      ),
    );
  }
}

void validateThenDoProduct(BuildContext context, bool update,
    ProductModelOfResturantWithImage? product, int? id) {
  if (context.read<AdminCubit>().formKeyProductKey.currentState!.validate()) {
    if (update) {
      print("update");
      context.read<AdminCubit>().eitherFailureOrUpdateProduct(product!.productModelOfResturant.id);
    } else {
      context.read<AdminCubit>().eitherFailureOrCreateProduct(id!);
    }
    Navigator.pop(context);
  } else {
    print("Validation failed. Please check the form inputs.");
  }
}

Widget productImage(ProductModelOfResturantWithImage product) {
  String? image = product.image;
  return Image.network(
    image!,
    height: 50,
    width: 50,
    fit: BoxFit.cover,
  );
}
