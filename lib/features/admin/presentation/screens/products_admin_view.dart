import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';

class ProductsAdminView extends StatefulWidget {

  final VoidCallback onBack;
  

  const ProductsAdminView({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  State<ProductsAdminView> createState() => _ProductsAdminViewState();
}

class _ProductsAdminViewState extends State<ProductsAdminView> {
  Uint8List? productImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        productImage = f;
      });
    }
  }



  void _showAddProductDialog() {
    
    productImage = null;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Product'),
        content: SingleChildScrollView(
          child: Form(
            key: context.read<AdminCubit>().formKeyProductKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: context.read<AdminCubit>().nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextFormField(
                  controller: context.read<AdminCubit>().priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: context.read<AdminCubit>().descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: context.read<AdminCubit>().availableQuantityController,
                  decoration: const InputDecoration(labelText: 'quantity'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image'),
                ),
                if (productImage != null)
                  Image.memory(
                    productImage!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
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
            onPressed: () {
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: _showAddProductDialog,
          icon: const Icon(Icons.add),
          label: const Text('Add New Product'),
        ),
        TextButton(
          onPressed: widget.onBack,
          child: const Text('Back to Shops'),
        ),
      ],
    );
  }
}
