import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';
import 'package:slash_tesk/core/shared/Loader.dart';
import 'package:slash_tesk/core/shared/customAppbar.dart';
import 'package:slash_tesk/features/product_details/presentaion/view/widgets/ColorPanel.dart';

import '../../../../core/shared/ErrorMsg.dart';
import '../view model/cubit/product_details_cubit.dart';

import 'widgets/MaterialPanel.dart';
import 'widgets/SizePanel.dart';
import 'widgets/customSlider.dart';
import 'widgets/product_name_and_price.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productID;

  const ProductDetailsScreen({super.key, required this.productID});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return Scaffold(
      appBar: customAppbar(title: "Product Details", fz: 23),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                CustomSlider(product: cubit.productDetails!),
                const SizedBox(height: 10),
                ProducNameandPrice(product: cubit.productDetails!),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.productDetails!.avaiableProperties!.length,
                    itemBuilder: (context, index) {
                      return cubit.productDetails!.avaiableProperties![index]
                                  .property ==
                              "Size"
                          ? SizePanel(
                              productSizes: cubit.productDetails!
                                  .avaiableProperties![index].values)
                          : cubit.productDetails!.avaiableProperties![index]
                                      .property ==
                                  "Color"
                              ? ColorPanel(
                                  productVariations:
                                      cubit.productDetails!.variations)
                              : MaterialPanel(
                                  productMaterials: cubit.productDetails!
                                      .avaiableProperties![index].values);
                    })
              ],
            ),
          );
        } else if (state is ProductDetailsFailure) {
          return ErrorMsg(errorMSG: state.errorMsg);
        } else {
          return const Center(child: Loader());
        }
      }),
    );
  }

  @override
  void initState() {
    BlocProvider.of<ProductDetailsCubit>(context)
        .getProductDetails(widget.productID);

    super.initState();
  }
}
