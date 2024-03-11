import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';
import 'package:slash_tesk/features/product_details/data/models/products_details_model.dart';
import 'package:slash_tesk/features/product_details/presentaion/view%20model/cubit/product_details_cubit.dart';

class ColorPanel extends StatelessWidget {
  final List<Variations>? productVariations;
  const ColorPanel({super.key, required this.productVariations});
  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit cubit = BlocProvider.of<ProductDetailsCubit>(context);

    return (productVariations!.isNotEmpty)
        ? DefaultTextStyle(
            style: const TextStyle(color: AppColors.white),
            child: Column(children: [
              const SizedBox(height: 30),
              const Align(
                  alignment: Alignment.centerLeft, child: Text("Select Color")),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: productVariations!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => cubit.selectProductColor(index),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: cubit.selectedColor == index
                              ? AppColors.primaryColor
                              : AppColors.black,
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(4),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: productVariations![index]
                              .productVarientImages![0]
                              .imagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              )
            ]),
          )
        : const SizedBox();
  }
}
