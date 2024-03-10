import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_tesk/core/shared/Loader.dart';
import 'package:slash_tesk/core/shared/customAppbar.dart';

import '../../../../core/shared/ErrorMsg.dart';
import '../view model/cubit/product_details_cubit.dart';
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
    return Scaffold(
      appBar: customAppbar(title: "Product Details", fz: 23),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                CustomSlider(product: state.product),
                const SizedBox(height: 10),
                ProducNameandPrice(product: state.product),
                const SizedBox(height: 30),
                SizePanel(product: state.product)
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
