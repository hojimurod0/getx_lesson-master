import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson/common/widgets/product_card_shimmer.dart';
import 'package:getx_lesson/controllers/card_controller.dart';
import 'package:getx_lesson/controllers/product_controller.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  static String path = "/products";

  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "Products",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => !productController.isLoading.value
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                var product = productController.products[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/image.png',
                      width: 600,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.title.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            cartController.addToCart(product);
                          },
                          child: Text('+', style: TextStyle(fontSize: 30)),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildShimmer();
              },
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productController.getProducts();
        },
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.blue[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Obx(() => Badge(
                  label: Text(cartController.cartItems.length.toString()),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                )),
            label: "Cart",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Get.toNamed("/cart");
          }
        },
      ),
    );
  }


}
