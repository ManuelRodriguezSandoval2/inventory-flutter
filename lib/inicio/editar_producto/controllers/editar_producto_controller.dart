import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/inicio/editar_producto/api/editar_producto_api.dart';
import 'package:flutter_application_1/models/producto_model.dart';
import 'package:get/get.dart';

class EditarProductoController extends GetxController {
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _precioController = TextEditingController();

  TextEditingController get nombreController => _nombreController;
  TextEditingController get precioController => _precioController;

  Producto? _producto;
  Producto? get producto => _producto;
  set producto(Producto? value) {
    _producto = value;
    update();
  }

  @override
  void onInit() {
    Producto? _prod = Get.arguments[0];
    producto = _prod;
    print("producto editar ${producto!.nombreProducto}");
    _nombreController.text = producto!.nombreBodega!;
    _precioController.text = producto!.cantidad!.toString();
  }

  /* actualizarProducto() async {
    await EditarProductoApi.instance.actualizarProductoApi(
        _nombreController.text, _precioController.text, producto!.id!);
  } */
}
