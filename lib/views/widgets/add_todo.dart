import 'package:flutter/material.dart';

class ToDoAddDialog extends StatefulWidget {
  const ToDoAddDialog({super.key});

  @override
  State<ToDoAddDialog> createState() => _ToDoAddDialogState();
}

class _ToDoAddDialogState extends State<ToDoAddDialog> {
  String title = '';

  final _formKey = GlobalKey<FormState>();

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Todo"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
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
              _add();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context, {
                  "title": title,
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Add"))
      ],
    );
  }
}