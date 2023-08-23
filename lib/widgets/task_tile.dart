import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.checkBoxCallBack,
    required this.isChecked,
  });

  final String taskTitle;
  final Function(bool?)? checkBoxCallBack;

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: isChecked
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                )
              : null,
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallBack,
        ));
  }
}
