import 'package:flutter/material.dart';

class ToDoEditDialog extends StatefulWidget {
   const ToDoEditDialog({super.key});

  @override
  State<ToDoEditDialog> createState() => _ToDoEditDialogState();
}

class _ToDoEditDialogState extends State<ToDoEditDialog> {
  String title = '';

  final _formKey = GlobalKey<FormState>();

  void _edit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit contact"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter title!";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  title = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _edit();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context, {
                  "title": title,
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Edit"))
      ],
    );
  }
}