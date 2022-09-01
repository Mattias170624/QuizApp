import 'dart:io';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class NewTodoSheet extends StatefulWidget {
  final Function addNewTodo;

  NewTodoSheet(this.addNewTodo);

  @override
  State<NewTodoSheet> createState() => _NewTodoSheetState();
}

class _NewTodoSheetState extends State<NewTodoSheet> {
  final todoController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'New Task:',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
          ),
          Platform.isAndroid
              ? TextField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: "Title"),
                  controller: todoController,
                )
              : Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CupertinoTextField(
                    placeholder: 'Title',
                    controller: todoController,
                    textInputAction: TextInputAction.next,
                  ),
                ),
          Platform.isAndroid
              ? TextField(
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(labelText: "Comment"),
                  controller: commentController,
                )
              : Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: CupertinoTextField(
                    placeholder: 'Comment',
                    controller: commentController,
                    textInputAction: TextInputAction.done,
                  ),
                ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: Platform.isAndroid
                ? ElevatedButton(
                    onPressed: closeModalSheet,
                    child: const Text("Add Task"),
                  )
                : CupertinoButton.filled(
                    onPressed: closeModalSheet,
                    child: const Text("Add Task"),
                  ),
          )
        ],
      ),
    );
  }

  void closeModalSheet() {
    final todo = todoController.text;
    final comment = commentController.text;

    widget.addNewTodo(todo, comment);
    Navigator.of(context).pop();
  }
}
