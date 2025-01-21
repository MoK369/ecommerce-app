import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/data/data_sources/categories_data_sources/categories_remote_data_source.dart';
import 'package:ecommerce/data/models/categories/categories_model_dto.dart';
import 'package:ecommerce/data/services/apis/api_manager.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImp implements CategoriesRemoteDataSource {
  ApiManager apiManager;
  // Constructor Injection
  @factoryMethod
  CategoriesRemoteDataSourceImp(this.apiManager);
  @override
  Future<ApiResult<List<CategoryData>>> getAllCategories() async {
    var apiResult = await apiManager.getAllCategories();
    switch (apiResult) {
      case Success<List<CategoryDataDto>>():
        var convertedList = apiResult.data.map<CategoryData>((categoryDto) {
          return categoryDto.convertToCategoryData();
        }).toList();
        return Success(data: convertedList);
      case ServerError<List<CategoryDataDto>>():
        return ServerError(
            serverErrorException: apiResult.serverErrorException);
      case CodeError<List<CategoryDataDto>>():
        return CodeError(exception: apiResult.exception);
    }
  }
}
