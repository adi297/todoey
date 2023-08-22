import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        TaskTile(task: 'Buy Milk', isDone: false),
        TaskTile(task: 'Buy Eggs', isDone: false),
        TaskTile(task: 'Buy Detergent', isDone: true),
      ],
    );
  }
}
