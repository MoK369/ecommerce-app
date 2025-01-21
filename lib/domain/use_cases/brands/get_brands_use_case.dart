import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';
import 'package:ecommerce/domain/repositories/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{
  BrandsRepository brandsRepository;
  @factoryMethod
  GetBrandsUseCase(this.brandsRepository);
  Future<ApiResult<List<BrandData>>> invoke() async{
    return brandsRepository.getAllBrands();
  }
}