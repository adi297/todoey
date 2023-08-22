import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              const TextField(
                autofocus: true,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
