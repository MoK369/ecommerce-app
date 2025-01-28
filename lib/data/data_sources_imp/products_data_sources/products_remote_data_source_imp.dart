import 'package:ecommerce/data/data_sources/products_data_sources/products_remote_data_source.dart';
import 'package:ecommerce/data/models/products/products_model_dto.dart';
import 'package:ecommerce/data/services/apis/api_manager.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/products/products_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImp implements ProductsRemoteDataSource {
  ApiManager apiManager;
  ProductsRemoteDataSourceImp({required this.apiManager});
  @override
  Future<ApiResult<List<ProductData>>> getProducts(
      {String? categoryId, String? subcategoryId, String? brandId}) async {
    var apiResult = await apiManager.getProducts(
        categoryId: categoryId, subcategoryId: subcategoryId, brandId: brandId);
    switch (apiResult) {
      case Success<List<ProductDataDto>>():
          var convertedList = apiResult.data.map<ProductData>((productDto) {
            return productDto.convertToProductData();
          },).toList();
          return Success(data: convertedList);
      case ServerError<List<ProductDataDto>>():
        return ServerError(serverErrorException: apiResult.serverErrorException);
      case CodeError<List<ProductDataDto>>():
        return CodeError(exception: apiResult.exception);
    }
  }
}
