import 'package:ecommerce/data/data_sources/brands_data_sources/brands_remote_data_source.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';
import 'package:ecommerce/domain/repositories/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImp implements BrandsRepository {
  BrandsRemoteDataSource brandsRemoteDataSource;
  @factoryMethod
  BrandsRepositoryImp(this.brandsRemoteDataSource);
  @override
  Future<ApiResult<List<BrandData>>> getAllBrands() {
    return brandsRemoteDataSource.getAllBrands();
  }
}
