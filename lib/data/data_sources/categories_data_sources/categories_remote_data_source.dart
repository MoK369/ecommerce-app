import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';

abstract class CategoriesRemoteDataSource{
  Future<ApiResult<List<CategoryData>>> getAllCategories();
}