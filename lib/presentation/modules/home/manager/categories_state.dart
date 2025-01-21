import 'package:ecommerce/domain/models/categories/categories_model.dart';

sealed class CategoriesState{}

class CategoriesLoadingState extends CategoriesState{}
class CategoriesSuccessState extends CategoriesState{
  List<CategoryData> listOfCategoryData;
  CategoriesSuccessState({required this.listOfCategoryData});
}
class CategoriesErrorState extends CategoriesState{
  Exception exception;

  CategoriesErrorState({required this.exception});
}