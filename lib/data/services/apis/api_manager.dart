import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/authentication/authentication_data_model_dto.dart';
import 'package:ecommerce/data/models/brands/brands_model_dto.dart';
import 'package:ecommerce/data/models/products/products_model_dto.dart';
import 'package:ecommerce/data/models/sign_in_parameters/sign_in_params_data_model.dart';
import 'package:ecommerce/data/models/sign_up_params/sign_up_params_data_model.dart';
import 'package:ecommerce/data/models/subcategories/subcategories_model_dto.dart';
import 'package:ecommerce/domain/custom_exceptions/server_error_exception.dart';
import 'package:ecommerce/domain/extension_methods/int_extension_methods/int_extension_methods.dart';
import 'package:ecommerce/domain/api_result/api_result.dart';
import 'package:ecommerce/data/models/categories/categories_model_dto.dart';
import 'package:ecommerce/data/models/error_model/error_model.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio _dio = Dio();
  static const String baseUrl = "https://ecommerce.routemisr.com";
  ApiManager() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
  }

  Future<ApiResult<List<CategoryDataDto>>> getAllCategories() async {
    try {
      //Uri url = Uri.https(baseUrl, EndPoints.allCategoriesEndPoint);
      var response = await _dio.get(baseUrl + EndPoints.allCategoriesEndPoint);
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        CategoriesModelDto categoriesResponse =
            CategoriesModelDto.fromJson(response.data);
        return Success(data: categoriesResponse.data ?? []);
      } else {
        /* I did this because when a server error happens dio package automatically return DioException.
         preventing try block from completing the its body. */
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Shouldn't Come Here 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Future<ApiResult<List<BrandDataDto>>> getAllBrands() async {
    try {
      var response = await _dio.get(baseUrl + EndPoints.allBrandsEndPoint);
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        BrandsModelDto brandsResponse = BrandsModelDto.fromJson(response.data);
        return Success(data: brandsResponse.data ?? []);
      } else {
        /* I did this because when a server error happens dio package automatically return DioException.
         preventing try block from completing the its body. */
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Shouldn't Come Here 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Future<ApiResult<List<SubCategoryDataDto>>> getAllSubcategories(
      String categoryId) async {
    try {
      var response = await _dio.get(baseUrl + EndPoints.getSubcategoriesEndPoint(categoryId));
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        SubcategoriesModelDto subcategoriesResponse =
            SubcategoriesModelDto.fromJson(response.data);
        return Success(data: subcategoriesResponse.data ?? []);
      } else {
        /* I did this because when a server error happens dio package automatically return DioException.
         preventing try block from completing the its body. */
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Shouldn't Come Here 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Future<ApiResult<List<ProductDataDto>>> getProducts(
      {String? categoryId, String? subcategoryId, String? brandId}) async {
    try {
      var response = await _dio.get(baseUrl + EndPoints.productsEndPoint,
          queryParameters: _getProductsApiQueryParameters(
              categoryId: categoryId,
              subcategoryId: subcategoryId,
              brandId: brandId));
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        ProductsModelDto productsResponse =
            ProductsModelDto.fromJson(response.data);
        return Success(data: productsResponse.data ?? []);
      } else {
        /* I did this because when a server error happens dio package automatically return DioException.
         preventing try block from completing the its body. */
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Shouldn't Come Here 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Map<String, dynamic> _getProductsApiQueryParameters(
      {String? categoryId, String? subcategoryId, String? brandId}) {
    Map<String, dynamic> resultMap = {};
    if (categoryId != null) {
      resultMap["category[in]"] = categoryId;
      return resultMap;
    } else if (subcategoryId != null) {
      resultMap["subcategory[in]"] = subcategoryId;
      return resultMap;
    } else if (brandId != null) {
      resultMap["brand"] = brandId;
      return resultMap;
    } else {
      return resultMap;
    }
  }

  Future<ApiResult<AuthenticationDataModelDto>> signIn(
      {required SignInParamsDataModel signInParams}) async {
    try {
      Response response = await _dio.post(baseUrl + EndPoints.signInEndPoint,
          data: signInParams.toJson());
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        AuthenticationDataModelDto authenticationResponse =
            AuthenticationDataModelDto.fromJson(response.data);
        return Success(data: authenticationResponse);
      } else {
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Something Went Wrong 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                    errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  Future<ApiResult<AuthenticationDataModelDto>> signUp(
      {required SignUpParamsDataModel signUpParams}) async {
    try {
      Response response = await _dio.post(baseUrl + EndPoints.signUpEndPoint,
          data: signUpParams.toJson());
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        AuthenticationDataModelDto authenticationResponse =
        AuthenticationDataModelDto.fromJson(response.data);
        return Success(data: authenticationResponse);
      } else {
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: "", message: "Something Went Wrong 🤔"));
      }
    } on DioException catch (e) {
      try {
        ErrorModel errorResponse = ErrorModel.fromJson(e.response?.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? "",
                message:
                errorResponse.errorMessage ?? "Something Went Wrong 🤔"));
      } catch (e) {
        debugPrint("Can't Be to Error Data Model");
      }
      return CodeError(exception: e);
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }
}


class EndPoints {
  static const String allCategoriesEndPoint = "/api/v1/categories";
  static const String allBrandsEndPoint = "/api/v1/brands";
  static const String productsEndPoint = "/api/v1/products";
  static const String signInEndPoint = "/api/v1/auth/signin";
  static const String signUpEndPoint = "/api/v1/auth/signup";
  static String getSubcategoriesEndPoint(String categoryId) {
    return "/api/v1/categories/$categoryId/subcategories";
  }
}
