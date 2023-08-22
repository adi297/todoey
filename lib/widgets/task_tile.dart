import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.isDone,
  });

  final String task;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: isDone
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: (bool? value) {},
      ),
    );
  }
}
