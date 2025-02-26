import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/controllers/todo_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  static String path = "/todoScreen";

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TodoController todoController = Get.find();
  final titleCntrl = TextEditingController();
  // final arg = Get.arguments as String;
  final name = Get.parameters["name"] ?? "Name is not provided";
  final age = Get.parameters["age"] ?? "age not given";

  @override
  void dispose() {
    super.dispose();
    titleCntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$name, $age"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<TodoController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return Dismissible(
                background: DecoratedBox(
                    decoration: BoxDecoration(
                  color: Colors.green,
                )),
                secondaryBackground:
                    DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
                key: Key(todo.title),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    controller.removeTodo(todo.title);
                  }
                },
                child: ListTile(
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            titleCntrl.text = todo.title;

                            Get.bottomSheet(BottomSheet(
                              onClosing: () {},
                              builder: (context) {
                                return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 30,
                                    horizontal: 50,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        style: TextStyle(
                                          fontSize: 26,
                                        ),
                                        "Update Todo",
                                      ),
                                      SizedBox(height: 50),
                                      TextField(
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            )),
                                        controller: titleCntrl,
                                      ),
                                      SizedBox(height: 50),
                                      ElevatedButton(
                                        onPressed: () {
                                          todoController.updateTodo(
                                              todo, titleCntrl.text);
                                          titleCntrl.clear();
                                          Get.back();

                                          Get.showSnackbar(GetSnackBar(
                                            isDismissible: true,
                                            animationDuration:
                                                Duration(milliseconds: 500),
                                            duration:
                                                Duration(milliseconds: 900),
                                            backgroundColor: Colors.green,
                                            message:
                                                "${todo.title} is updated successfully",
                                          ));
                                        },
                                        child: Text("Update"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ));

                            // Get.defaultDialog(
                            //     title: "Update todo",
                            //     content: TextField(
                            //       controller: titleCntrl,
                            //     ),
                            //     actions: [
                            //       TextButton(
                            //         onPressed: () {

                            //           todoController.updateTodo(
                            //               todo, titleCntrl.text);
                            //           titleCntrl.clear();
                            //           Get.back();

                            //           Get.showSnackbar(GetSnackBar(
                            //             isDismissible: true,
                            //             animationDuration:
                            //                 Duration(milliseconds: 500),
                            //             duration: Duration(milliseconds: 900),
                            //             backgroundColor: Colors.green,
                            //             message:
                            //                 "${todo.title} is updated successfully",
                            //           ));
                            //         },
                            //         child: Text("Update"),
                            //       ),
                            //     ]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            controller.toggleIsDone(todo);
                            log(todo.isDone.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                  title: Text(todo.title),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      todoController.addTodo(titleCntrl.text);
                      titleCntrl.clear();
                      Get.back();
                    },
                    child: Text("Add"),
                  ),
                ],
                title: Text("Add todo, do not sleep please!!!!!"),
                content: TextField(
                  controller: titleCntrl,
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
