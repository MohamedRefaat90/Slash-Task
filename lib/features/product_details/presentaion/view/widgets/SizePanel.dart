import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';
import 'package:slash_tesk/features/product_details/data/models/products_details_model.dart';
import 'package:slash_tesk/features/product_details/presentaion/view%20model/cubit/product_details_cubit.dart';

class SizePanel extends StatelessWidget {
  final List<Values>? productSizes;
  const SizePanel({super.key, required this.productSizes});
  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit cubit = BlocProvider.of<ProductDetailsCubit>(context);
    Set uniqueproductMaterials = {};
    // Remove All Duplicates Values
    productSizes!.retainWhere((e) => uniqueproductMaterials.add(e.value));

    return (productSizes!.isNotEmpty)
        ? DefaultTextStyle(
            style: const TextStyle(color: AppColors.white),
            child: Column(children: [
              const SizedBox(height: 30),
              const Row(
                children: [Text("Select Size"), Spacer(), Text("Size Chart")],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: uniqueproductMaterials.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => cubit.selectProductSize(index),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: cubit.selectedSize == index
                              ? AppColors.primaryColor
                              : AppColors.black,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(uniqueproductMaterials.toList()[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.white)),
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
