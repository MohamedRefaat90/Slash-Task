import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slash_tesk/core/constants/app_routes.dart';

class ImageCard extends StatelessWidget {
  final int selectedIndex;

  final int index;
  final String imgURL;
  const ImageCard({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.imgURL,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.productImage,
          extra: {"id": selectedIndex, "img": imgURL}),
      child: AnimatedContainer(
        width: 150,
        duration: const Duration(milliseconds: 500),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        curve: Curves.easeInOutCubic,
        margin: EdgeInsets.all(selectedIndex == index ? 0 : 10),
        transformAlignment: selectedIndex > index
            ? Alignment.centerRight // left images
            : Alignment.center, // right images
        transform: Matrix4.rotationZ(
          selectedIndex == index
              ? 0
              : selectedIndex > index
                  ? (pi / 180) * -17 // left images
                  : (pi / 180) * 17, // right images
        ),
        child: CachedNetworkImage(
          imageUrl: imgURL,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const SizedBox(),
        ),
      ),
    );
  }
}
