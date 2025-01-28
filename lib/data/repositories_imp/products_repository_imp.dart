import 'package:ecommerce/data/data_sources/products_data_sources/products_remote_data_source.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/domain/repositories/products/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImp implements ProductsRepository {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImp({required this.productsRemoteDataSource});
  @override
  Future<ApiResult<List<ProductData>>> getProducts(
      {String? categoryId, String? subcategoryId, String? brandId}) {
    return productsRemoteDataSource.getProducts(
        categoryId: categoryId, subcategoryId: subcategoryId, brandId: brandId);
  }
}
