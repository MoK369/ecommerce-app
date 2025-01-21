import 'package:ecommerce/data/data_sources/brands_data_sources/brands_remote_data_source.dart';
import 'package:ecommerce/data/models/brands/brands_model_dto.dart';
import 'package:ecommerce/data/services/apis/api_manager.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/domain/models/brands/brands_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImp implements BrandsRemoteDataSource {
  ApiManager apiManager;
  @factoryMethod
  BrandsRemoteDataSourceImp(this.apiManager);
  @override
  Future<ApiResult<List<BrandData>>> getAllBrands() async {
    var apiResult = await apiManager.getAllBrands();
    switch (apiResult) {
      case Success<List<BrandDataDto>>():
        var convertedList = apiResult.data.map<BrandData>(
          (brandDtoEl) {
            return brandDtoEl.convertTotBrandsData();
          },
        ).toList();
        return Success(data: convertedList);
      case ServerError<List<BrandDataDto>>():
        return ServerError(
            serverErrorException: apiResult.serverErrorException);
      case CodeError<List<BrandDataDto>>():
        return CodeError(exception: apiResult.exception);
    }
  }
}
