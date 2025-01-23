import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';

sealed class SubcategoriesState {}

class SubcategoriesLoadingState extends SubcategoriesState {}

class SubcategoriesSuccessState extends SubcategoriesState {
  List<SubcategoryData> subcategories;
  SubcategoriesSuccessState({required this.subcategories});
}

class SubcategoriesErrorState extends SubcategoriesState {
  Exception exception;
  SubcategoriesErrorState({required this.exception});
}
