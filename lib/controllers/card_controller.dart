import 'package:get/get.dart';
import 'package:getx_lesson/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
    Get.snackbar("Success", "${product.title} added to cart");
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar("Removed", "${product.title} removed from cart");
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
  }
}