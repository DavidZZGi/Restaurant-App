import 'package:flutter/material.dart';

import '../model/models.dart';
import 'ProductCart.dart';

class ProductCarusel extends StatelessWidget {
  final List<Product> products;
  const ProductCarusel({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 160,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ProductCard(product: products[index]),
              );
            }),
      ),
    );
  }
}
