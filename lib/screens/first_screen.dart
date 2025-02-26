import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/common/local_storage/app_local_storage.dart';
import 'package:getx_lesson/screens/todo_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  static String path = "/first_screen";

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final valueController = TextEditingController();
  final AppLocalStorage appLocalStorage = AppLocalStorage();

  @override
  void dispose() {
    super.dispose();
    valueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Get.defaultDialog(
              //   title: "Diqqat!",
              //   middleText: "Siz rostdan ham o'chirmoqchimisiz?",
              //   textConfirm: "Ha",
              //   textCancel: "Yo'q",
              //   confirmTextColor: Colors.white,
              //   onConfirm: () {
              //     print("O'chirildi!");
              //     Get.back(); // Dialogni yopish
              //   },
              //   onCancel: () => print("Bekor qilindi!"),
              // );

              // Get.to(TodoScreen(), arguments: "tODOS SCREEN UCHUN ARG");

// Get.toNamed('${TodoScreen.path}?name=Sunnat&age=25');
              Get.toNamed(TodoScreen.path);
            },
            icon: Icon(
              Icons.notification_add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: IconButton.filled(
              onPressed: () {
                Get.defaultDialog(
                  textConfirm: "Save",
                  onConfirm: () {
                    appLocalStorage.saveSomething(
                        "something", valueController.text);
                    Get.back();
                    valueController.clear();
                  },
                  content: TextField(
                    controller: valueController,
                  ),
                );
              },
              icon: Icon(Icons.arrow_right),
            ),
          ),
          TextButton(
              onPressed: () {
                log(appLocalStorage.readSomething("something"));
              },
              child: Text(
                "Read from local",
                style: TextStyle(color: Colors.amber),
              )),
          ElevatedButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Text("change the theme"),
          ),
        ],
      ),
    );
  }
}
