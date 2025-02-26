import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_lesson/models/todo_model.dart';

class TodoController extends GetxController {
  RxList<TodoModel> todos = <TodoModel>[
    TodoModel(title: 'Buy milk'),
    TodoModel(title: 'Buy eggs'),
    TodoModel(title: 'Buy bread'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    log("todo controller yaratildi");
  }

  // remove todo
  void removeTodo(String title) {
    todos.removeWhere((todo) => todo.title == title);
  }

  // add todo
  void addTodo(String title) {
    final TodoModel todoModel = TodoModel(title: title);
    todos.add(todoModel);
    update();
  }

  // toggle isDone
  void toggleIsDone(TodoModel todo) {
    todo.isDone = !todo.isDone;
    update();
  }

  // update todo
  void updateTodo(TodoModel todo, String newTitle) {
    int index = todos.indexOf(todo);
    todos[index].title = newTitle;
    update();
  }
}
