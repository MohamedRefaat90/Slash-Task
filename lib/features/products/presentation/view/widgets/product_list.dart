import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import 'productCard.dart';

class ProductsList extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsList({
    super.key,
    required this.products,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCard(product: products[index]),
    );
  }
}
