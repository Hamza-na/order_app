import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/features/admin/presentation/cubit/admin_cubit.dart';

class ChangeRoleView extends StatefulWidget {
  const ChangeRoleView({Key? key}) : super(key: key);

  @override
  State<ChangeRoleView> createState() => _ChangeRoleViewState();
}

class _ChangeRoleViewState extends State<ChangeRoleView> {
  String selectedRole = 'User'; // Default role
  final TextEditingController idController = TextEditingController();

  void _applyRoleChange() {
    String id = idController.text;
    if (id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an ID')),
      );
      return;
    }

    if (selectedRole == 'Admin') {
      // Perform admin-specific action
      _makeAdmin(id);
    } else if (selectedRole == 'User') {
      // Perform user-specific action
      _makeUser(id);
    }
  }

  void _makeAdmin(String id) {
    // Handle logic to change the role to Admin
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User with ID: $id is now an Admin')),
    );
    context.read<AdminCubit>().eitherFailureOrToAdmin(int.parse(id));
    // Add logic to update role in backend or state management
  }

  void _makeUser(String id) {
    // Handle logic to change the role to User
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Admin with ID: $id is now a User')),
    );
    context.read<AdminCubit>().eitherFailureOrToUser(int.parse(id));
    // Add logic to update role in backend or state management
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Change User Role',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Dropdown for role selection
          DropdownButton<String>(
            value: selectedRole,
            items: const [
              DropdownMenuItem(value: 'Admin', child: Text('Admin')),
              DropdownMenuItem(value: 'User', child: Text('User')),
            ],
            onChanged: (String? value) {
              setState(() {
                selectedRole = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          // TextField for ID input
          TextField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'Enter User/Admin ID',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _applyRoleChange,
            child: const Text('Apply Role Change'),
          ),
        ],
      ),
    );
  }
}
