import 'package:chromatec/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskName;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20.0,
                ),
              ),
              TextField(
                // Faz com que o teclado já surja com o modal
                // graças ao autofocus no TextField
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  taskName = value;
                },
              ),
              FlatButton(
                child: Text('Add'),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPressed: () {
                  // TODO: Porque listen = false?
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(taskName);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
