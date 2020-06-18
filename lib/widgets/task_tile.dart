import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function removeTaskCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.removeTaskCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        removeTaskCallback();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
