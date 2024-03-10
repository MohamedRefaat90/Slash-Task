import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';

class ProductImageScreen extends StatelessWidget {
  final Map product;
  const ProductImageScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 550,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Hero(
                      tag: product["id"],
                      child: CachedNetworkImage(
                        imageUrl: product["img"],
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  onPressed: () => context.pop(),
                  color: AppColors.white,
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
