import 'package:dio/dio.dart';
import 'package:flutter_application_1/login2/login_controller.dart';
import 'package:flutter_application_1/models/bodega_model.dart';
import 'package:flutter_application_1/models/producto_model.dart';

import 'package:flutter_application_1/utils/globals.dart';
import 'package:get/get.dart' as getx;

class BodegaApi {
  BodegaApi._internal();
  static BodegaApi _instance = BodegaApi._internal();
  static BodegaApi get instance => _instance;

  Future<List<Bodega>?> consultaBodegaAPi() async {
    String? url = Globals.URL_SERVER + "/obtener_bodega";
    Response response;
    var _loginController = getx.Get.find<LoginController>();
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    dio.options.headers["Authorization"] =
        'Bearer ${_loginController.usuarioLogin!.accessToken}';

    try {
      response = await dio
          .get(url, queryParameters: {}).timeout(const Duration(seconds: 200));

      switch (response.statusCode) {
        case 200:
          List<Bodega> bodegas = bodegaFromJson(response.data);
          return bodegas;

        case 404:
          print(response.data);

          throw Exception(response.data);

        default:
          return response.data!;
      }
    } on DioError catch (x) {
      switch (x.response?.statusCode) {
        case 404:
          print(x.response?.data);

          throw Exception(x.response?.data);
        case 500:
          print(x.response?.data);

          throw Exception(x.response?.data);

        case 429:
          print(x.response?.data);

          throw Exception(x.response?.data);
      }
    } on Exception catch (e) {
      throw Exception(
          "Error al consultar producto, reintente. ${e.toString()}");
    }
  }
}
