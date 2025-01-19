import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/core/helper/extention.dart';
import 'package:order_app/core/routing/routes.dart';
import 'package:order_app/core/widgets/rounded_button.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_state.dart';
import 'package:order_app/features/settings/presentation/cubit/profile_cubit.dart';
import 'package:order_app/generated/l10n.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(S.of(context).address),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: primaryColor),
            onPressed: () {},
          ),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            
            if(state is MeSuccessfully){
            final orderCartCubit = context.read<OrderCartCubit>();
            orderCartCubit.setDefaultAddress(state.userModel.location);
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<OrderCartCubit, OrderCartState>(
                      builder: (context, state) {
                        final orderCartCubit = context.read<OrderCartCubit>();
                        final address = orderCartCubit
                            .addressController.text.isNotEmpty
                            ?orderCartCubit.address:
                            orderCartCubit.defaultAddress ??
                                "add your location";
                        return ListTile(
                          leading: const Icon(Icons.location_on,
                              color: primaryColor),
                          trailing: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (dialogContext) => BlocProvider.value(
                                  value: context.read<OrderCartCubit>(),
                                  child: const AddressDialog(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            child: Text(
                              S.of(context).change,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          title: Text(address!),
                        );
                      },
                    ),
                    const Spacer(),
                    BlocBuilder<OrderCartCubit, OrderCartState>(
                      buildWhen: (previous, current) {
                        return current is OrderInUpdateState ||
                            current is OrderInDefaultState;
                      },
                      builder: (context, state) {
                        if (state is OrderInUpdateState) {
                          return _buildUpdateOrderUI(context, state.order.id);
                        } else if (state is OrderInDefaultState) {
                          return _buildPlaceOrderUI(context);
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    )
                  ],
                ));
            }
            return const  SizedBox();
          },
        ));
  }

  Widget _buildUpdateOrderUI(BuildContext context, int id) {
    return Center(
      child: RoundedButton(
        press: () {
          context
              .read<OrderCartCubit>()
              .eitherFailureOrUpdatingOrders(orderId: id);
              context.pushNamed(Routes.order);
          
        },
        text: S.of(context).update,
      ),
    );
  }

  Widget _buildPlaceOrderUI(BuildContext context) {
    return Center(
      child: RoundedButton(
        press: () {
          context.read<OrderCartCubit>().eitherFailureOrOrderCart();
          context.pushNamed(Routes.order);
          
        },
        text: S.of(context).order,
      ),
    );
  }
}

class AddressDialog extends StatelessWidget {
  const AddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCartCubit = context.read<OrderCartCubit>();

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              // Single Form wrapping all fields
              key: orderCartCubit.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).edit_address,
                    style:
                        const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: S.of(context).location_name,
                    hint: S.of(context).location_name_hint,
                    textEditingController: orderCartCubit.addressController,
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: S.of(context).town_name,
                    hint: S.of(context).town_hint,
                    textEditingController: orderCartCubit.areaController,
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: S.of(context).street,
                    hint: S.of(context).street,
                    textEditingController: orderCartCubit.streetController,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    S.of(context).address_details,
                    style:
                      const  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: S.of(context).address_detail_hint,
                      hintStyle: const TextStyle(color: Color(0xff9ba4aa)),
                      fillColor: const Color(0xffEEF2F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xff666f71)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                    ),
                    controller: orderCartCubit.floorController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).validate_null;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(primaryColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text(S.of(context).cancel),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(primaryColor),
                        ),
                        onPressed: () {
                          validateThenDoOrder(context);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoOrder(BuildContext context) {
    final orderCartCubit = context.read<OrderCartCubit>();
    orderCartCubit.emitAddress();
    if (orderCartCubit.formKey.currentState!.validate()) {
      orderCartCubit.address = 
          "${orderCartCubit.addressController.text}/${orderCartCubit.areaController.text}/${orderCartCubit.streetController.text}/${orderCartCubit.floorController.text}";

      Navigator.of(context).pop();
    }
  }

  Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController textEditingController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff9ba4aa)),
            fillColor: const Color(0xffEEF2F5),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xff666f71)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "value cannot be empty";
            }
            return null;
          },
          controller: textEditingController,
        ),
      ],
    );
  }
}
