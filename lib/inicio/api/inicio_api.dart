import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/producto_model.dart';

import 'package:flutter_application_1/utils/globals.dart';

class InicioApi {
  InicioApi._internal();
  static InicioApi _instance = InicioApi._internal();
  static InicioApi get instance => _instance;

  Future<List<Producto>?> consultaProductoAPi() async {
    String? url = Globals.URL_SERVER + "/obtener_ingreso";
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    try {
      response = await dio
          .get(url, queryParameters: {}).timeout(const Duration(seconds: 100));

      switch (response.statusCode) {
        case 200:
          List<Producto> productos = productoFromJson(response.data);
          return productos;

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
