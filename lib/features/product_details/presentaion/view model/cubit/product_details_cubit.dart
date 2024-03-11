import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:slash_tesk/features/product_details/data/models/products_details_model.dart';
import 'package:slash_tesk/features/product_details/data/repos/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;
  ProductDetailsModel? productDetails;
  int selectedSize = 0;
  int selectedColor = 0;
  int selectedMaterial = 0;
  ProductDetailsCubit(this._productDetailsRepo)
      : super(ProductDetailsInitial());

  void changeSliderIndicator(
      int selectedIndex, int index, PageController controller) {
    selectedIndex = index;
    controller.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  Future<void> getProductDetails(int productID) async {
    emit(ProductDetailsLoading());

    var response = await _productDetailsRepo.getProductsDetailsData(productID);

    // if Requset to Api fail , will emit Failure State with errorMsg
    // otherwise emit Success State with product Details

    response.fold(
        (failure) => emit(ProductDetailsFailure(errorMsg: failure.errMsg)),
        (product) {
      productDetails = product;

      return emit(ProductDetailsSuccess());
    });
  }

  selectProductSize(int index) {
    selectedSize = index;
    emit(ProductDetailsSuccess());
  }

  selectProductColor(int index) {
    selectedColor = index;
    emit(ProductDetailsSuccess());
  }

  selectProductMaterial(int index) {
    selectedMaterial = index;
    emit(ProductDetailsSuccess());
  }
}
