import 'package:ecommerce/data/models/categories/categories_model_dto.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostCommonCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  @factoryMethod
  GetMostCommonCategoriesUseCase(this.categoriesRepository);

  Future<ApiResult<List<CategoryData>>> invoke({int limit = 10}) async {
    var apiResult = await categoriesRepository.getAllCategories();
    if (apiResult is Success<List<CategoryData>>) {
      if(apiResult.data.length < limit) limit = apiResult.data.length;
      var newApiResult = apiResult.data.getRange(0, limit);
      return Success<List<CategoryData>>(data: newApiResult.toList());
    } else {
      return apiResult;
    }
  }
}
