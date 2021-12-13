import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/crear_producto/api/crear_producto_api.dart';
import 'package:get/get.dart';

class CrearProductoController extends GetxController {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _precioController = TextEditingController();

  TextEditingController get nombreController => _nombreController;
  TextEditingController get precioController => _precioController;

  crearProducto() async {
    await CrearProductoApi.instance
        .crearProductoApi(_nombreController.text, _precioController.text)
        .then((value) {
      print(value);
    }).catchError((error) {});
  }
}
