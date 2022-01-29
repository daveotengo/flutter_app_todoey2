import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task_obj.dart';
//import 'package:flutter_app_todoey2/models/task_obj.dart';

class  TaskListObj extends ChangeNotifier{

  //final List<TaskData> _tasks = [];

  final List<TaskData> _tasks = [
    TaskData(taskName: 'Finish the app',isDone: false),
    TaskData(taskName: 'Write a blog post',isDone: false),
    TaskData(taskName: 'Share with community',isDone: false),
  ];


  UnmodifiableListView<TaskData> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<TaskData> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((todo) => !todo.isDone));
  UnmodifiableListView<TaskData> get completedTasks =>
      UnmodifiableListView(_tasks.where((todo) => todo.isDone));

  void addTodo(TaskData task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(TaskData task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleDone();
    notifyListeners();
  }

  void deleteTodo(TaskData task) {
    _tasks.remove(task);
    notifyListeners();
  }



}
