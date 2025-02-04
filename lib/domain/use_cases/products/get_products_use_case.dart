import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:ecommerce/domain/repositories/products/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  ProductsRepository productsRepository;
  GetProductsUseCase({required this.productsRepository});

  Future<ApiResult<List<ProductData>>> invoke(
      {String? categoryId, String? subcategoryId, String? brandId}) {
    return productsRepository.getProducts(
        categoryId: categoryId, subcategoryId: subcategoryId, brandId: brandId);
  }
}
