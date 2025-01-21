import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/categories_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CategoriesPageViewModel extends Cubit<CategoriesPageState> {
  @factoryMethod
  CategoriesPageViewModel() : super(OnCategoriesListState());

  void changeState(CategoriesPageState newState){
    emit(newState);
  }
}
