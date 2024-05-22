import 'package:dars_1_uy_ishi/controllers/contact_contorller.dart';
import 'package:dars_1_uy_ishi/views/widgets/add_contact.dart';
import 'package:dars_1_uy_ishi/views/widgets/contact_widget.dart';
import 'package:dars_1_uy_ishi/views/widgets/edit_contact.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactsController contactsController = ContactsController();

  void delete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return const ContactEditDialog();
        });

    if (data != null) {
      contactsController.edit(data['name'], data['phone'], index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: contactsController.lst.length,
          itemBuilder: (ctx, index) {
            return ContactItem(
              contactsController.lst[index],
              edit: () => edit(index),
              onDelete: () => delete(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const ContactAddDialog();
              });
          if (data != null) {
            contactsController.add(data['name'], data['phone']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}