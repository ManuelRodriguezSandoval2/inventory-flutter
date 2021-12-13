import 'package:dio/dio.dart';

import 'package:flutter_application_1/utils/globals.dart';

class EditarProductoApi {
  EditarProductoApi._internal();
  static EditarProductoApi _instance = EditarProductoApi._internal();
  static EditarProductoApi get instance => _instance;

  actualizarProductoApi(String nombre, String precio, int id) async {
    String? url = Globals.URL_SERVER + "/editar_producto";
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    try {
      response = await dio.put(url, queryParameters: {
        'id': id,
        'nombre': nombre,
        'precio': precio
      }).timeout(const Duration(seconds: 100));

      switch (response.statusCode) {
        case 200:
          print("Ok");
          break;
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
          "Error al consultar producto, reintente. ${e.toString()}");
    }
  }
}
