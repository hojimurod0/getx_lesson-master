import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_lesson/common/bindings/app_binding.dart';
import 'package:getx_lesson/screens/card_screen.dart';
import 'package:getx_lesson/screens/first_screen.dart';
import 'package:getx_lesson/screens/products_screen.dart';
import 'package:getx_lesson/screens/todo_screen.dart';
import 'package:getx_lesson/screens/splash_screen.dart';

void main() async {
  await GetStorage.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GetX Lesson",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: FirstScreen.path, page: () => FirstScreen()),
        GetPage(name: TodoScreen.path, page: () => TodoScreen()),
        GetPage(name: ProductsScreen.path, page: () => ProductsScreen()),
        GetPage(name: CartScreen.path, page: () => CartScreen()),
      ],
      initialBinding: AppBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
