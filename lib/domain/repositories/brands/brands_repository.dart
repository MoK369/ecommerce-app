import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';

abstract class BrandsRepository {
  Future<ApiResult<List<BrandData>>> getAllBrands();
}
