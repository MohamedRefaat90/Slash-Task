import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash_tesk/features/products/data/models/product_model.dart';
import 'package:slash_tesk/features/products/data/repos/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _productsRepo;
  int selectdProduct = 0;
  ProductsCubit(this._productsRepo) : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    var response = await _productsRepo.getProductsData();

    // if Requset to Api fail , will emit Failure State with errorMsg
    // otherwise emit Success State with List of products

    response.fold((failure) => emit(ProductsFailure(errorMSG: failure.errMsg)),
        (products) => emit(ProductsSuccess(products: products)));
  }
}
