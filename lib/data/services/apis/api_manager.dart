import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/brands/brands_model_dto.dart';
import 'package:ecommerce/domain/custom_exceptions/server_error_exception.dart';
import 'package:ecommerce/domain/extension_methods/int_extension_methods/int_extension_methods.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/data/models/categories/categories_model_dto.dart';
import 'package:ecommerce/data/models/error_model/error_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio _dio = Dio();
  static const String baseUrl = "ecommerce.routemisr.com";

  Future<ApiResult<List<CategoryDataDto>>> getAllCategories() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.allCategoriesEndPoint);
      var response = await _dio.getUri(url);
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        CategoriesModelDto categoriesResponse =
            CategoriesModelDto.fromJson(response.data);
        return Success(data: categoriesResponse.data ?? []);
      } else {
        ErrorModel errorResponse = ErrorModel.fromJson(response.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      }
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Future<ApiResult<List<BrandDataDto>>> getAllBrands() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.allBrandsEndPoint);
      var response = await _dio.getUri(url);
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        BrandsModelDto brandsRespond = BrandsModelDto.fromJson(response.data);
        return Success(data: brandsRespond.data ?? []);
      } else {
        ErrorModel errorResponse = ErrorModel.fromJson(response.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      }
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }
}

class EndPoints {
  static const String allCategoriesEndPoint = "/api/v1/categories";
  static const String allBrandsEndPoint = "/api/v1/brands";
}
