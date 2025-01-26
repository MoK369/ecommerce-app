import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/domain/repositories/products/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImp implements ProductsRepository {
  @override
  Future<ApiResult<List<ProductData>>> getProducts(
      {String? categoryId, String? subcategoryId, String? brandId}) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
