import 'package:dio/dio.dart';

import 'package:flutter_application_1/utils/globals.dart';

class IngresarInventarioApi {
  IngresarInventarioApi._internal();
  static IngresarInventarioApi _instance = IngresarInventarioApi._internal();
  static IngresarInventarioApi get instance => _instance;

  Future<String?> ingresarInventarioApi(String idProducto, String cantidad, String idBodega) async {
    String? url = Globals.URL_SERVER + "/ingreso_inventario";
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    try {
      response = await dio.post(url, queryParameters: {
        "id_producto": idProducto,
        "cantidad": cantidad,
        "id_bodega": idBodega
      }).timeout(const Duration(seconds: 100));

      switch (response.statusCode) {
        case 200:
          return response.data;

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
      }
    } on Exception catch (e) {
      throw Exception(
          "Error. ${e.toString()}");
    }
  }
}
