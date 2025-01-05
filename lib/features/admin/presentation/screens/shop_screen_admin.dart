import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';


class ShopScreenAdmin extends StatefulWidget {


  const ShopScreenAdmin({
    Key? key,
    
  }) : super(key: key);

  @override
  State<ShopScreenAdmin> createState() => _ShopScreenAdminState();
}

class _ShopScreenAdminState extends State<ShopScreenAdmin> {
  Uint8List? shopImage;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        shopImage = f;
      });
    }
  }

  void _showAddShopDialog() {
    shopImage = null;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Shop'),
        content: SingleChildScrollView(
          child: Form(
            key: context.read<AdminCubit>().formMarketKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                controller: context.read<AdminCubit>().nameController,
                decoration: const InputDecoration(labelText: 'Shop Name')
                ),
                TextFormField(controller: context.read<AdminCubit>().descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
                TextFormField(controller: context.read<AdminCubit>().locationController, 
                decoration: const InputDecoration(labelText: 'Location')
                ),
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image'),
                ),
                if (shopImage != null)
                  Image.memory(
                    shopImage!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteShop(int index) {
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        const Spacer(),
         Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton.icon(
            onPressed: _showAddShopDialog,
            icon: const Icon(Icons.add),
            label: const Text('Add New Shop'),
          ),
        ),
      ],
    );
  }
}
