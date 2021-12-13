import 'package:flutter_application_1/inicio/api/inicio_api.dart';
import 'package:flutter_application_1/models/producto_model.dart';
import 'package:get/get.dart';

class InicioController extends GetxController {
  List<Producto> _productos = [];
  List<Producto> get productos => _productos;
  set productos(List<Producto> data) {
    _productos = data;
    update();
  }

  obtenerProductos() async {
    await InicioApi.instance.consultaProductoAPi().then((data) {
      if (data != null) {
        productos = data;
      }
    }).catchError((error) {});
  }

  editarProducto(Producto producto) {
    Get.toNamed('/editar_producto', arguments: [producto]);
  }
}
