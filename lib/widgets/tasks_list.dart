import 'package:chromatec/models/task_data.dart';
import 'package:chromatec/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Solução sem Consumer
//    List<Task> tasks = Provider.of<TaskData>(context).tasks;
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            Task task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              removeTaskCallback: () {
                taskData.removeTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
