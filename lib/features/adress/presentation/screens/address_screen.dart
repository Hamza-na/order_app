import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/constant/colors/colors.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_cubit.dart';
import 'package:order_app/features/adress/presentation/cubit/order_cart_state.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();

  
}

class _AddressScreenState extends State<AddressScreen> {

@override
  void initState() async{
    super.initState();
    await context.read<OrderCartCubit>().checkOrderState() ;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Address"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<OrderCartCubit, OrderCartState>(
              builder: (context, state) {
                final address = context.read<OrderCartCubit>().address ?? "No address selected";
                return ListTile(
                  leading: const Icon(Icons.location_on, color: primaryColor),
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
                    child: const Text(
                      "change",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  title: const Text(
                    "Work",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(address),
                );
              },
            ),
            const Spacer(),
            BlocBuilder<OrderCartCubit, OrderCartState>(
        builder: (context, state) {
        if (state is OrderInUpdateState) {
          return _buildUpdateOrderUI(context);
        } else if (state is OrderInDefaultState) {
          return _buildPlaceOrderUI(context);
        } 
        return const Center(child: CircularProgressIndicator());
      },
    )])));
  }

  Widget _buildUpdateOrderUI(BuildContext context) {
    return ElevatedButton.icon(
          onPressed: () {
            context.read<OrderCartCubit>().eitherFailureOrUpdatingOrders(orderId: 1);
          },
          icon: const Icon(Icons.update),
          label: const Text('Update'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        );
      
  }

  Widget _buildPlaceOrderUI(BuildContext context) {
    return
        ElevatedButton.icon(
          onPressed: () {
            context.read<OrderCartCubit>().eitherFailureOrOrderCart();
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Order'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
            child: Form( // Single Form wrapping all fields
              key: orderCartCubit.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Edit Address",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: 'اسم العنوان',
                    hint: 'مثال: المنزل، العمل، الجيم، المدرسة، إلخ',
                    textEditingController: orderCartCubit.addressController,
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: 'المنطقة',
                    hint: 'بلدية الميدان',
                    textEditingController: orderCartCubit.areaController,
                  ),
                  const SizedBox(height: 16.0),
                  buildTextField(
                    label: 'الشارع',
                    hint: 'الشارع',
                    textEditingController: orderCartCubit.streetController,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'تفاصيل العنوان',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText:
                          'مثال: المبنى الأول، الطابق 2، ثم اضغط على الجرس، أو اترك الطرد بجانب الباب.',
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
                        return "value cannot be empty";
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
                        child: const Text("Cancel"),
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
    if (orderCartCubit.formKey.currentState!.validate()) {
      orderCartCubit.address =
          "${orderCartCubit.addressController.text}/${orderCartCubit.areaController.text}/${orderCartCubit.streetController.text}/${orderCartCubit.detailsAddressController.text}/${orderCartCubit.floorController.text}";
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
