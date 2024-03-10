import 'package:flutter/material.dart';
import 'package:slash_tesk/features/product_details/presentaion/view/widgets/ImageIndicator.dart';

import '../../../data/models/products_details_model.dart';
import 'ImageCard.dart';

class CustomSlider extends StatefulWidget {
  final ProductDetailsModel product;

  const CustomSlider({super.key, required this.product});

  @override
  State<CustomSlider> createState() => CustomSliderState();
}

class CustomSliderState extends State<CustomSlider> {
  int selectedIndex = 0;
  PageController controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    // print("===================================");
    // // print(widget.product.variations!.length);
    // print(widget.product.variations!.length);
    // print("===================================");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
              itemCount:
                  widget.product.variations![0].productVarientImages!.length,
              controller: controller,
              pageSnapping: true,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return ImageCard(
                    selectedIndex: selectedIndex,
                    index: index,
                    imgURL: widget.product.variations![0]
                        .productVarientImages![index].imagePath!);
              }),
        ),
        const SizedBox(height: 40),
        ImageIndicator(
            imgsUrl: widget.product.variations![0].productVarientImages!,
            selectedIndex: selectedIndex,
            pageController: controller)
      ],
    );
  }
}
