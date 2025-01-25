import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/subcategories/Subcategories_model.dart';
import 'package:ecommerce/domain/use_cases/subcategories/get_subcategories_use_case.dart';
import 'package:ecommerce/presentation/modules/home/pages/categories_page/manager/subcategories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesViewModel extends Cubit<SubcategoriesState> {
  GetSubcategoriesUseCase getSubcategoriesUseCase;
  SubcategoriesViewModel({required this.getSubcategoriesUseCase})
      : super(SubcategoriesLoadingState());

  Future<void> loadSubcategories(String categoryId) async {
    emit(SubcategoriesLoadingState());
    var useCaseResult = await getSubcategoriesUseCase.invoke(categoryId);
    switch (useCaseResult) {
      case Success<List<SubcategoryData>>():
        emit(SubcategoriesSuccessState(subcategories: useCaseResult.data));
      case ServerError<List<SubcategoryData>>():
        emit(SubcategoriesErrorState(
            exception: useCaseResult.serverErrorException));
      case CodeError<List<SubcategoryData>>():
        emit(SubcategoriesErrorState(exception: useCaseResult.exception));
    }
  }
  void changeState(SubcategoriesState newState){
    emit(newState);
  }
}
