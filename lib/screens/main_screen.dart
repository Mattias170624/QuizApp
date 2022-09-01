import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../widgets/new_todo_sheet.dart';
import '../widgets/todo_list.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<TodoItem> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: const Text('To Do:'),
            ),
            body: Center(
              child: TodoList(todoList, deleteTodoItem),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add_task_rounded),
              onPressed: () => showModalSheet(context),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: CupertinoColors.systemBlue,
              middle: const Text('To Do:'),
              trailing: GestureDetector(
                onTap: () => showModalSheet(context),
                child: const Icon(
                  Icons.add,
                  color: CupertinoColors.systemGreen,
                ),
              ),
            ),
            child: Center(
              child: TodoList(todoList, deleteTodoItem),
            ),
          );
  }

  void showModalSheet(BuildContext context) {
    Platform.isAndroid
        ? showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Material(
              child: NewTodoSheet(addNewTodo),
            ),
          )
        : showCupertinoModalPopup(
            context: context,
            builder: (context) => Material(
              child: NewTodoSheet(addNewTodo),
            ),
          );
  }

  void addNewTodo(String titel, String kommentar) {
    final newToDo = TodoItem(titel, kommentar);

    setState(() {
      todoList.add(newToDo);
    });
  }

  void deleteTodoItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
}
