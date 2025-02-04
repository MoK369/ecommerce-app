import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';

abstract class ProductsRemoteDataSource{
  Future<ApiResult<List<ProductData>>> getProducts(
      {String? categoryId, String? subcategoryId, String? brandId});
}