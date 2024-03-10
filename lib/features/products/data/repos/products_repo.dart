import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:slash_tesk/core/classes/failure.dart';
import 'package:slash_tesk/core/utils/api_handler.dart';
import 'package:slash_tesk/features/products/data/models/product_model.dart';

class ProductsRepo {
  final ApiHandler _apiHandler;

  ProductsRepo(this._apiHandler);

  Future<Either<Failure, List<ProductModel>>> getProductsData() async {
    try {
      var response = await _apiHandler.getAllProduct();
      List<ProductModel> products =
          response.map((item) => ProductModel.fromJson(item)).toList();
      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
