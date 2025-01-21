import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/domain/use_cases/categories/get_most_common_categories_use_case.dart';
import 'package:ecommerce/presentation/modules/home/manager/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CategoriesViewModel extends Cubit<CategoriesState> {
  //CategoriesRepository categoriesRepo;
  GetMostCommonCategoriesUseCase getMostCommonCategoriesUseCase;
  @factoryMethod
  CategoriesViewModel(this.getMostCommonCategoriesUseCase)
      : super(CategoriesLoadingState());

  Future<void> loadCategories() async {
    emit(CategoriesLoadingState());
    var useCaseResult = await getMostCommonCategoriesUseCase.invoke();
    switch (useCaseResult) {
      case Success<List<CategoryData>>():
        emit(CategoriesSuccessState(listOfCategoryData: useCaseResult.data));
        break;
      case ServerError<List<CategoryData>>():
        emit(CategoriesErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<List<CategoryData>>():
        emit(CategoriesErrorState(exception: useCaseResult.exception));
    }
  }
}
