
import 'package:flutter_application_1/inicio/consultar_stock/api/consulta_stock_api.dart';
import 'package:flutter_application_1/inicio/producto_por_bodega/api/bodega_api.dart';
import 'package:flutter_application_1/login2/login_controller.dart';
import 'package:flutter_application_1/models/bodega_producto_model.dart';
import 'package:flutter_application_1/models/consulta_stock_model.dart';
import 'package:get/get.dart';

class ConsultaStockController extends GetxController {
  var vacio="Sin datos";
  List<ConsultaStock> _consultastock = [];
  List<ConsultaStock> get consultastock => _consultastock;
  set consultastock(List<ConsultaStock> data) {
    _consultastock = data;
    update();
  }

 /*  ConsultaStock? _producto;
  ConsultaStock? get producto => _producto;
  set producto(ConsultaStock? value) {
    _producto = value;
    update();
  } */

  /* @override
  void onInit() {
    ConsultaStock? _prod = Get.arguments[0];
    _consultastock = _prod;
  } */

  obtenerStockProductos(String? consultastocks) async {
    await ConsultaStockApi.instance.consultaStockApi(consultastocks).then((data) {
      if (data != null) {
        consultastock = data;
      }else if(data==[]){
        print("nada");
      }

    }).catchError((error) {});
  }

   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var _loginController = Get.find<LoginController>();
  }

  /* editarProducto(ConsultaStock producto) {
    Get.toNamed('/editar_producto', arguments: [producto]);
  } */
}