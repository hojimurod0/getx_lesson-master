import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:getx_lesson/models/product_model.dart';

Widget buildShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 200, width: double.infinity, color: Colors.white),
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 20, width: double.infinity, color: Colors.white),
              SizedBox(height: 5),
              Container(height: 15, width: 150, color: Colors.white),
              SizedBox(height: 5),
              Container(height: 15, width: 100, color: Colors.white),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 25, width: 80, color: Colors.white),
                  Container(height: 20, width: 60, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProductContent(Product product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          product.image.toString(),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              "Brand: ${product.brand} | Model: ${product.model}",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Text(
              "Color: ${product.color.toString().toUpperCase()}",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                if (product.discount != null)
                  if (product.discount! > 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${product.discount}% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
