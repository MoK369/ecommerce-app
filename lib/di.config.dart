// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/data_sources/brands_data_sources/brands_remote_data_source.dart'
    as _i528;
import 'data/data_sources/categories_data_sources/categories_remote_data_source.dart'
    as _i332;
import 'data/data_sources/products_data_sources/products_remote_data_source.dart'
    as _i275;
import 'data/data_sources_imp/brands_data_sources/brands_remote_data_source_imp.dart'
    as _i605;
import 'data/data_sources_imp/Categories_data_sources/categories_remote_data_source_imp.dart'
    as _i82;
import 'data/data_sources_imp/products_data_sources/products_remote_data_source_imp.dart'
    as _i481;
import 'data/repositories_imp/brands_repository_imp.dart' as _i124;
import 'data/repositories_imp/categories_repository_imp.dart' as _i321;
import 'data/repositories_imp/products_repository_imp.dart' as _i413;
import 'data/services/apis/api_manager.dart' as _i265;
import 'domain/repositories/brands/brands_repository.dart' as _i391;
import 'domain/repositories/categories/categories_repository.dart' as _i785;
import 'domain/repositories/products/products_repository.dart' as _i912;
import 'domain/use_cases/brands/get_brands_use_case.dart' as _i876;
import 'domain/use_cases/categories/get_most_common_categories_use_case.dart'
    as _i82;
import 'domain/use_cases/products/get_products_use_case.dart' as _i114;
import 'domain/use_cases/subcategories/get_subcategories_use_case.dart'
    as _i816;
import 'presentation/modules/home/manager/categories_view_model.dart' as _i256;
import 'presentation/modules/home/pages/categories_page/manager/catgories_page_view_model.dart'
    as _i11;
import 'presentation/modules/home/pages/categories_page/manager/subcategories_view_model.dart'
    as _i970;
import 'presentation/modules/home/pages/home_page/manager/brands_view_model.dart'
    as _i296;
import 'presentation/modules/products/manager/products_view_model.dart'
    as _i1026;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i265.ApiManager>(() => _i265.ApiManager());
    gh.singleton<_i11.CategoriesPageViewModel>(
        () => _i11.CategoriesPageViewModel());
    gh.factory<_i275.ProductsRemoteDataSource>(() =>
        _i481.ProductsRemoteDataSourceImp(apiManager: gh<_i265.ApiManager>()));
    gh.factory<_i912.ProductsRepository>(() => _i413.ProductsRepositoryImp(
        productsRemoteDataSource: gh<_i275.ProductsRemoteDataSource>()));
    gh.factory<_i528.BrandsRemoteDataSource>(
        () => _i605.BrandsRemoteDataSourceImp(gh<_i265.ApiManager>()));
    gh.factory<_i114.GetProductsUseCase>(() => _i114.GetProductsUseCase(
        productsRepository: gh<_i912.ProductsRepository>()));
    gh.factory<_i391.BrandsRepository>(
        () => _i124.BrandsRepositoryImp(gh<_i528.BrandsRemoteDataSource>()));
    gh.factory<_i332.CategoriesRemoteDataSource>(
        () => _i82.CategoriesRemoteDataSourceImp(gh<_i265.ApiManager>()));
    gh.factory<_i876.GetBrandsUseCase>(
        () => _i876.GetBrandsUseCase(gh<_i391.BrandsRepository>()));
    gh.singleton<_i296.BrandsViewModel>(
        () => _i296.BrandsViewModel(gh<_i876.GetBrandsUseCase>()));
    gh.factory<_i1026.ProductsViewModel>(() => _i1026.ProductsViewModel(
        getProductsUseCase: gh<_i114.GetProductsUseCase>()));
    gh.factory<_i785.CategoriesRepository>(() =>
        _i321.CategoriesRepositoryImp(gh<_i332.CategoriesRemoteDataSource>()));
    gh.factory<_i82.GetMostCommonCategoriesUseCase>(() =>
        _i82.GetMostCommonCategoriesUseCase(gh<_i785.CategoriesRepository>()));
    gh.factory<_i816.GetSubcategoriesUseCase>(
        () => _i816.GetSubcategoriesUseCase(gh<_i785.CategoriesRepository>()));
    gh.factory<_i970.SubcategoriesViewModel>(() => _i970.SubcategoriesViewModel(
        getSubcategoriesUseCase: gh<_i816.GetSubcategoriesUseCase>()));
    gh.singleton<_i256.CategoriesViewModel>(() =>
        _i256.CategoriesViewModel(gh<_i82.GetMostCommonCategoriesUseCase>()));
    return this;
  }
}
