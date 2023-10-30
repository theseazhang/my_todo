import 'package:flutter/material.dart';
import 'package:my_todo/todo.dart';

class NewTodoDialog extends StatelessWidget {
  NewTodoDialog({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('新建事务'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('确认'),
          onPressed: () {
            final todo = Todo(title: controller.value.text, isDone: false);
            controller.clear();
            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
