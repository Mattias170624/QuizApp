import '../models/todo_item.dart';
import "package:flutter/material.dart";

class TodoList extends StatelessWidget {
  final List<TodoItem> list;
  final Function deleteTodoItem;

  TodoList(this.list, this.deleteTodoItem);

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Material(
                child: Container(
                  color: Colors.black12,
                  margin: const EdgeInsets.only(top: 5),
                  child: Material(
                    child: ListTile(
                      leading: Text(list[index].title),
                      subtitle: Text(list[index].comment),
                      trailing: GestureDetector(
                        onTap: (() => deleteTodoItem(index)),
                        child:
                            const Icon(Icons.remove_circle, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('No tasks found.'),
              Text('Start by creating a new task!')
            ],
          );
  }
}
