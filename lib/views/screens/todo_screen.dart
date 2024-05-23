import 'package:dars_1_uy_ishi/controllers/todo_controller.dart';
import 'package:dars_1_uy_ishi/views/widgets/add_todo.dart';
import 'package:dars_1_uy_ishi/views/widgets/edit_todo.dart';
import 'package:dars_1_uy_ishi/views/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final ToDoController toDoController = ToDoController();

  void delete(int index) {
    toDoController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return const ToDoEditDialog();
        });

    if (data != null) {
      toDoController.edit(data['title'], index);
      setState(() {});
    }
  }

  void changeposition(int index) {
    toDoController.changeposition(index);
    setState(() {});
  }

  List counter() {
    return toDoController.counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Finished: ${counter()[0]}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const Text("ToDo"),
            Text(
              "Not Finished: ${counter()[1]}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // centerTitle: true,
        titleSpacing: 1,
      ),
      body: ListView.builder(
          itemCount: toDoController.lst.length,
          itemBuilder: (ctx, index) {
            return ToDoItem(
              toDoController.lst[index],
              edit: () => edit(index),
              onDelete: () => delete(index),
              changeposition: () => changeposition(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const ToDoAddDialog();
              });
          if (data != null) {
            toDoController.add(data['title']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
