import 'package:dars_1_uy_ishi/controllers/todo_controller.dart';
import 'package:dars_1_uy_ishi/models/todo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoItem extends StatefulWidget {
  final Function() onDelete;
  final Function() edit;
  final Function() changeposition;
  final ToDo todo;
  const ToDoItem(this.todo,
      {super.key,
      required this.onDelete,
      required this.changeposition,
      required this.edit});

  @override
  // ignore: no_logic_in_create_state
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  final ToDoController toDoController = ToDoController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.changeposition,
      child: ListTile(
        leading: widget.todo.check
            ? Icon(
                Icons.square_outlined,
                color: Colors.blue,
              )
            : Icon(
                Icons.check_box,
                color: Colors.blue,
              ),
        title: Text(widget.todo.title,
            style: widget.todo.check
                ? TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
                : TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: widget.todo.check ? widget.edit : () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                )),
            IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
