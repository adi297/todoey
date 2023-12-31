import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../models/task_data.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(
                  addTask: () {
                    setState(() {
                      Provider.of<TaskData>(context, listen: false)
                          .addTaskData(textEditingController.text);
                      textEditingController.clear();
                    });
                    Navigator.pop(context);
                  },
                  textEditingController: textEditingController,
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.blueAccent,
                    size: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TaskTile(
                    taskTitle: Provider.of<TaskData>(context).tasks[index].name,
                    checkBoxCallBack: (bool? checkBoxState) {
                      setState(() {
                        Provider.of<TaskData>(context, listen: false)
                            .tasks[index]
                            .toggleDone();
                      });
                    },
                    isChecked:
                        Provider.of<TaskData>(context).tasks[index].isDone,
                  );
                },
                itemCount: Provider.of<TaskData>(context).tasks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
