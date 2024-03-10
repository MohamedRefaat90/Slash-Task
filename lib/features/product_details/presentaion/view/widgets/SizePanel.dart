import 'package:flutter/widgets.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';
import 'package:slash_tesk/features/product_details/data/models/products_details_model.dart';

class SizePanel extends StatelessWidget {
  final ProductDetailsModel product;
  const SizePanel({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return product.avaiableProperties![0].values!.isNotEmpty
        ? DefaultTextStyle(
            style: const TextStyle(color: AppColors.white),
            child: Column(children: [
              const Row(
                children: [Text("Select Size"), Spacer(), Text("Size Chart")],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: product.avaiableProperties![0].values!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                          product.avaiableProperties![0].values![index].value!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.white)),
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
