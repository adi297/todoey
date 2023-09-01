import 'package:flutter/cupertino.dart';

import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Detergent'),
  ];

  addTaskData(task) {
    tasks.add(Task(name: task));
  }
}
