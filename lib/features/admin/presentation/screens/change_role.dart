import 'package:flutter/material.dart';

class ChangeRoleView extends StatefulWidget {
  const ChangeRoleView({Key? key}) : super(key: key);

  @override
  State<ChangeRoleView> createState() => _ChangeRoleViewState();
}

class _ChangeRoleViewState extends State<ChangeRoleView> {
  String selectedRole = 'User'; // Default role
  final TextEditingController idController = TextEditingController();

  void _applyRoleChange() {
    String id = idController.text.trim();
    if (id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an ID')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Role changed to $selectedRole with ID: $id')),
    );
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
