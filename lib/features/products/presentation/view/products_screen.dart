import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_tesk/features/products/presentation/view%20model/cubit/products_cubit.dart';

import '../../../../core/shared/ErrorMsg.dart';
import '../../../../core/shared/Loader.dart';
import '../../../../core/shared/customAppbar.dart';
import 'widgets/product_list.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(title: 'Slash.', fz: 30),
        body: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
          if (state is ProductsSuccess) {
            return ProductsList(products: state.products);
          } else if (state is ProductsFailure) {
            return ErrorMsg(errorMSG: state.errorMSG);
          } else {
            return const Loader();
          }
        }),
      ),
    );
  }
}
