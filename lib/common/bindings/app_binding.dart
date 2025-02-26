import 'package:get/get.dart';
import 'package:getx_lesson/controllers/todo_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
