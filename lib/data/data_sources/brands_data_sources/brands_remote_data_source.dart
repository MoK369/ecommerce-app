import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';

abstract class BrandsRemoteDataSource{
  Future<ApiResult<List<BrandData>>> getAllBrands();
}