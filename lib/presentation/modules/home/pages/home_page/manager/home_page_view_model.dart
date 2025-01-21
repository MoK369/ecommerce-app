// import 'package:ecommerce/domain/api_result/api_result.dart';
// import 'package:ecommerce/domain/models/brands/brands_model.dart';
// import 'package:ecommerce/domain/models/categories/categories_model.dart';
// import 'package:ecommerce/domain/use_cases/brands/get_brands_use_case.dart';
// import 'package:ecommerce/domain/use_cases/categories/get_most_common_categories_use_case.dart';
// import 'package:ecommerce/presentation/modules/home/pages/home_page/manager/home_page_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
//
// @injectable
// class HomePageViewModel extends Cubit<HomePageState> {
//   //CategoriesRepository categoriesRepo;
//   GetMostCommonCategoriesUseCase getMostCommonCategoriesUseCase;
//   GetBrandsUseCase getBrandsUseCase;
//   @factoryMethod
//   HomePageViewModel(this.getMostCommonCategoriesUseCase, this.getBrandsUseCase)
//       : super(InitialHomeState());
//
//   Future<void> loadCategories() async {
//     emit(CategoriesState(loadingState: LoadingState()));
//     var useCaseResult = await getMostCommonCategoriesUseCase.invoke();
//     switch (useCaseResult) {
//       case Success<List<CategoryData>>():
//         emit(CategoriesState(
//             successState: SuccessState(listOfData: useCaseResult.data)));
//         break;
//       case ServerError<List<CategoryData>>():
//         emit(CategoriesState(
//             errorState:
//                 ErrorState(exception: useCaseResult.serverErrorException)));
//       case CodeError<List<CategoryData>>():
//         emit(CategoriesState(
//             errorState: ErrorState(exception: useCaseResult.exception)));
//     }
//   }
//
//   Future<void> loadBrands() async {
//     emit(BrandsState(loadingState: LoadingState()));
//     var useCaseResult = await getBrandsUseCase.invoke();
//     switch (useCaseResult) {
//       case Success<List<BrandData>>():
//         emit(BrandsState(
//             successState: SuccessState(listOfData: useCaseResult.data)));
//       case ServerError<List<BrandData>>():
//         emit(BrandsState(
//             errorState:
//                 ErrorState(exception: useCaseResult.serverErrorException)));
//       case CodeError<List<BrandData>>():
//         emit(BrandsState(
//             errorState: ErrorState(exception: useCaseResult.exception)));
//     }
//   }
// }
