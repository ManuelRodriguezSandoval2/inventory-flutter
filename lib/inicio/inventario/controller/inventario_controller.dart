import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/bodega/controller/bodega_controller.dart';
import 'package:flutter_application_1/inicio/inventario/api/inventario_api.dart';
import 'package:get/get.dart';

class IngresarInventarioController extends GetxController {
  TextEditingController _idBodegaController = TextEditingController();
  TextEditingController _idProductoController = TextEditingController();
  TextEditingController _cantidadController = TextEditingController();

  TextEditingController get idBodegaController => _idBodegaController;
  TextEditingController get idProductoController => _idProductoController;
  TextEditingController get cantidadController => _cantidadController;

  ingresarInventario() async {
    await IngresarInventarioApi.instance
        .ingresarInventarioApi(_idProductoController.text,
            _cantidadController.text, _idBodegaController.text)
        .then((value) {
      print(value);
    }).catchError((error) {});
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var _bodegaController = Get.find<BodegaController>();
    print("id bodega: ${_bodegaController.idBodega}");
  }

  setCodigo(String codigo) {
    idProductoController.text = codigo;
    update();
  }
}
