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
    return Scaffold(
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
    );
  }

  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewTodoSheet(addNewTodo),
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
