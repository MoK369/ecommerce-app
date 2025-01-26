import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/domain/use_cases/products/get_products_use_case.dart';
import 'package:ecommerce/presentation/modules/products/manager/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsState> {
  GetProductsUseCase getProductsUseCase;
  ProductsViewModel({required this.getProductsUseCase})
      : super(ProductsLoadingState());

  void loadProducts(
      {String? categoryId, String? subcategoryId, String? brandId}) async {
    emit(ProductsLoadingState());
    var useCaseResult = await getProductsUseCase.invoke(
        categoryId: categoryId, subcategoryId: subcategoryId, brandId: brandId);
    switch (useCaseResult) {
      case Success<List<ProductData>>():
        emit(ProductsSuccessState(products: useCaseResult.data));
      case ServerError<List<ProductData>>():
        emit(ProductsErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<List<ProductData>>():
        emit(ProductsErrorState(exception: useCaseResult.exception));
    }
  }
}
