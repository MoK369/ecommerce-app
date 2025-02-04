import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<ApiResult<List<CategoryData>>> getAllCategories();
  Future<ApiResult<List<SubcategoryData>>> getAllSubcategories(
      String categoryId);
}
