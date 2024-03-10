import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:slash_tesk/features/product_details/data/models/products_details_model.dart';

class ProducNameandPrice extends StatelessWidget {
  final ProductDetailsModel product;

  const ProducNameandPrice({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white, fontSize: 16),
      child: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 180,
                    child: Text(
                      product.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                const SizedBox(height: 20),
                Text("EGP ${product.variations![0].price}"),
              ]),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: CachedNetworkImage(
                    imageUrl: product.brandImage!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/logo.png")),
              ),
              const SizedBox(height: 15),
              Text(product.brandName!)
            ],
          )
        ],
      ),
    );
  }
}
