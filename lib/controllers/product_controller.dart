import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_lesson/models/product_model.dart';
import 'package:getx_lesson/services/products_service.dart';

class ProductController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getProducts();
  }

  RxList<Product> products = <Product>[].obs;
  final ProductsService productsService = ProductsService();
  RxBool isLoading = false.obs;

  Future<void> getProducts() async {
    log("get products called");
    isLoading.value = true;
    update();

    try {
      final productsData = await productsService.fetchProducts();
      if (productsData != null) {
        products.addAll(productsData.products!);
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
    isLoading.value = false;
    update();
  }
}
