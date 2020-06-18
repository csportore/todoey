import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:chromatec/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(newTaskTitle) {
    _tasks.add(Task(
      name: newTaskTitle,
    ));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
    notifyListeners();
  }
}
