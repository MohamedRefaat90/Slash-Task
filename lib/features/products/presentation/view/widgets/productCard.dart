import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slash_tesk/core/constants/app_routes.dart';

import '../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(AppRoutes.productDetals, extra: product.id),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          Container(
            width: 180,
            height: 110,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: product
                  .productVariations![0].productVarientImages![0].imagePath!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 100,
              child: Text(
                product.name!,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: CachedNetworkImage(
                imageUrl: product.brands!.brandLogoImagePath!,
                errorWidget: (context, url, error) => const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
              ),
            )
          ]),
          const SizedBox(height: 10),
          DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Row(children: [
                Text(
                  "EGP ${product.productVariations![0].price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border)),
                InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Ink(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                    )),
              ])),
        ]),
      ),
    );
  }
}
