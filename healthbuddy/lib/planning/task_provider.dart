import 'package:flutter/material.dart';

class Taskzuprovider {
  final String title;
  final DateTime date;

  Taskzuprovider({required this.title, required this.date});
}

class TaskProvider extends ChangeNotifier {
  final List<Taskzuprovider> _tasks = [];

  List<Taskzuprovider> get tasks => _tasks;

  void addTask(Taskzuprovider task) {
    _tasks.add(task);
    notifyListeners();
  }

  /// ⭐ NEW — check if a day already has tasks
  bool hasTask(DateTime date) {
    return _tasks.any((t) =>
        t.date.year == date.year &&
        t.date.month == date.month &&
        t.date.day == date.day);
  }
}