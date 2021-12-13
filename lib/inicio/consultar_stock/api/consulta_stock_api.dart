import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/consulta_stock_model.dart';

import 'package:flutter_application_1/utils/globals.dart';

class ConsultaStockApi {
  ConsultaStockApi._internal();
  static ConsultaStockApi _instance = ConsultaStockApi._internal();
  static ConsultaStockApi get instance => _instance;

  consultaStockApi(String? idProducto) async {
    String? url = Globals.URL_SERVER + "/obtener_ingreso";
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    try {
      response = await dio
          .get(url, queryParameters: {

            'busqueda': idProducto,
          }).timeout(const Duration(seconds: 200));

print(response);

      switch (response.statusCode) {
        case 200:
          List<ConsultaStock> consultastock = consultaStockFromJson(response.data);
          return consultastock;

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
