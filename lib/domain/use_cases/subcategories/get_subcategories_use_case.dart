import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';
import 'package:ecommerce/domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubcategoriesUseCase {
  CategoriesRepository categoriesRepository;
  GetSubcategoriesUseCase(this.categoriesRepository);


  Future<ApiResult<List<SubcategoryData>>> invoke(String categoryId){
    return categoriesRepository.getAllSubcategories(categoryId);
  }
}