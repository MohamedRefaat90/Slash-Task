import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/classes/failure.dart';
import '../../../../core/utils/api_handler.dart';
import '../../../products/data/models/product_model.dart';
import '../models/products_details_model.dart';

class ProductDetailsRepo {
  final ApiHandler _apiHandler;

  ProductDetailsRepo(this._apiHandler);

  Future<Either<Failure, ProductDetailsModel>> getProductsDetailsData(
      int productID) async {
    try {
      var response = await _apiHandler.getProductDetails(productID);

      ProductDetailsModel productDetails =
          ProductDetailsModel.fromJson(response);

      return Right(productDetails);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
