import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/common/widgets/product_card_shimmer.dart';
import 'package:getx_lesson/controllers/card_controller.dart';
import 'package:getx_lesson/models/product_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  static String path = "/cart";

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => cartController.cartItems.isEmpty
          ? Center(
              child: Text("Your cart is empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      buildShimmer();

                      var product = cartController.cartItems[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/image.png',
                            width: 600, // Rasm o‘lchamini moslashtirish
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                              height: 8), // Rasm va matn orasidagi bo‘sh joy
                          Text(
                            product.title.toString(),
                            style: TextStyle(fontSize: 18),
                            textAlign:
                                TextAlign.center, // Matnni markazga joylash
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  height:
                                      8), // Narx va tugma orasidagi bo‘sh joy
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: Colors.red, size: 30),
                                onPressed: () {
                                  cartController.removeFromCart(product);
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: \$${cartController.totalAmount}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.snackbar(
                              "Order Placed", "Thank you for your order!");
                          cartController.cartItems.clear();
                        },
                        child: Text("Buyurtma berish "),
                      ),
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
