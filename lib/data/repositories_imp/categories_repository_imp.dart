import 'dart:async';
import 'package:ecommerce/data/data_sources/categories_data_sources/categories_remote_data_source.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/categories/categories_model.dart';
import 'package:ecommerce/domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImp implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource;
  // constructor injection
  @factoryMethod
  CategoriesRepositoryImp(this.remoteDataSource);
  @override
  Future<ApiResult<List<CategoryData>>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }
}
