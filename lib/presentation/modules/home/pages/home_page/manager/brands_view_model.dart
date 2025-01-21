import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';
import 'package:ecommerce/domain/use_cases/brands/get_brands_use_case.dart';
import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class BrandsViewModel extends Cubit<BrandsState> {
  //CategoriesRepository categoriesRepo;
  GetBrandsUseCase getBrandsUseCase;
  @factoryMethod
  BrandsViewModel(this.getBrandsUseCase) : super(BrandsLoadingState());

  Future<void> loadBrands() async {
    emit(BrandsLoadingState());
    var useCaseResult = await getBrandsUseCase.invoke();
    switch (useCaseResult) {
      case Success<List<BrandData>>():
        emit(BrandsSuccessState(listOfBrandData: useCaseResult.data));
      case ServerError<List<BrandData>>():
        emit(BrandsErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<List<BrandData>>():
        emit(BrandsErrorState(exception: useCaseResult.exception));
    }
  }
}
