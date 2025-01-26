import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';

sealed class CategoriesPageState {}

class OnCategoriesListState extends CategoriesPageState {}

class OnCategoriesProductsState extends CategoriesPageState {
  SubcategoryData subcategoryItem;
  OnCategoriesProductsState({required this.subcategoryItem});
}
