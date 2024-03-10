import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view model/cubit/product_details_cubit.dart';

class ImageIndicator extends StatelessWidget {
  final int selectedIndex;
  final PageController pageController;
  final List imgsUrl;
  const ImageIndicator(
      {super.key,
      required this.selectedIndex,
      required this.pageController,
      required this.imgsUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: imgsUrl.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            BlocProvider.of<ProductDetailsCubit>(context)
                .changeSliderIndicator(selectedIndex, index, pageController);
          },
          child: Container(
            width: 50,
            padding: const EdgeInsets.all(5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: index == selectedIndex
                  ? Border.all(color: Colors.lightGreen, width: 2)
                  : Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: imgsUrl[index].imagePath!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
