import 'package:ecommerce/domain/models/products/products_model.dart';

sealed class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  List<ProductData> products;
  ProductsSuccessState({required this.products});
}

class ProductsErrorState extends ProductsState {
  Exception exception;
  ProductsErrorState({required this.exception});
}
