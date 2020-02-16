import 'package:flutter/material.dart';

import '../../../components/add_task.dart';
import '../../../components/todo_item_tile.dart';
import '../../../data/todo_list.dart';

class All extends StatefulWidget {
  All({Key key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("All tab");
    return Column(
      children: <Widget>[
        AddTask(
          onAdd: (value) {
            todoList.addTodo(value);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: todoList.list.length,
            itemBuilder: (context, index) {
              return TodoItemTile(
                item: todoList.list[index],
                delete: () {
                  setState(() {
                    todoList.removeTodo(todoList.list[index].id);
                  });
                },
                toggleIsCompleted: () {
                  setState(() {
                    todoList.toggleList(todoList.list[index].id);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
