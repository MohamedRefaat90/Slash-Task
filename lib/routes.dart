import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';
import 'package:slash_tesk/core/dependency%20injection/dependency_injection.dart';
import 'package:slash_tesk/core/utils/api_handler.dart';
import 'package:slash_tesk/features/product_details/data/repos/product_details_repo.dart';
import 'package:slash_tesk/features/products/data/repos/products_repo.dart';

import 'core/shared/offline.dart';
import 'features/product_details/presentaion/view model/cubit/product_details_cubit.dart';
import 'features/product_details/presentaion/view/productImage_screen.dart';
import 'features/product_details/presentaion/view/product_details_screen.dart';
import 'features/products/presentation/view model/cubit/products_cubit.dart';
import 'features/products/presentation/view/products_screen.dart';

final GoRouter routers = GoRouter(routes: [
  GoRoute(
      path: "/",
      name: "allProducts",
      builder: (context, state) => BlocProvider(
            create: (context) => ProductsCubit(
                ProductsRepo(DependencyInjection.getIt.get<ApiHandler>()))
              ..getAllProducts(),
            child: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  if (connectivity != ConnectivityResult.none) {
                    return child;
                  } else {
                    return const Offline();
                  }
                },
                child: const ProductsScreen()),
          )),
  GoRoute(
      path: "/productDetails",
      name: "/productDetails",
      builder: (context, state) => BlocProvider(
            create: (context) => ProductDetailsCubit(ProductDetailsRepo(
                DependencyInjection.getIt.get<ApiHandler>())),
            child: ProductDetailsScreen(productID: state.extra as int),
          )),
  GoRoute(
      path: "/productImage",
      name: "/productImage",
      builder: (context, state) =>
          ProductImageScreen(product: state.extra as Map)),
]);
