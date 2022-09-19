import 'package:dio/dio.dart';
import 'package:flutter_tech_test/app/api_service/error_exception.dart';
import 'package:flutter_tech_test/app/modules/product_detail/model/model_product_detail.dart';
import 'package:flutter_tech_test/app/modules/product_list/model/model_product_list.dart';

class APIService {
  String url = 'https://recruitment.dev.rollingglory.com/api/v2/gifts';
  Future<ModelListProduct> getListProduct() async {
    Response response;
    Dio dio = Dio();

    var urlRequest = '$url?page[number]=1&page[size]=6';
    try {
      response = await dio.get(
        urlRequest,
      );

      return ModelListProduct.fromJson(response.data);
    } on DioError catch (dioError) {
      final errorMessage = DioException.fromDioError(dioError).toString();

      throw errorMessage;
    }
  }

  Future<ModelProductDetail> getProductDetail(id) async {
    Response response;
    Dio dio = Dio();

    var urlRequest = '$url/$id';
    try {
      response = await dio.get(
        urlRequest,
      );

      return ModelProductDetail.fromJson(response.data);
    } on DioError catch (dioError) {
      final errorMessage = DioException.fromDioError(dioError).toString();

      throw errorMessage;
    }
  }
}
