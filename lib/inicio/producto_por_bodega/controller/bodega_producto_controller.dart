
import 'package:flutter_application_1/inicio/producto_por_bodega/api/bodega_api.dart';
import 'package:flutter_application_1/models/bodega_producto_model.dart';
import 'package:get/get.dart';

class BodegaProductoController extends GetxController {
  List<BodegaProducto> _bodegasxproductos = [];
  List<BodegaProducto> get bodegasxproductos => _bodegasxproductos;
  set bodegasxproductos(List<BodegaProducto> data) {
    _bodegasxproductos = data;
    update();
  }

 /*  BodegaProducto? _producto;
  BodegaProducto? get producto => _producto;
  set producto(BodegaProducto? value) {
    _producto = value;
    update();
  } */

  /* @override
  void onInit() {
    BodegaProducto? _prod = Get.arguments[0];
    _bodegasxproductos = _prod;
  } */

  obtenerBodegasProductos(BodegaProducto bodegaproducto) async {
    await BodegaProductoApi.instance.consultaBodegaProductoAPi(bodegaproducto.idBodega!).then((data) {
      if (data != null) {
        bodegasxproductos = data;
      }
    }).catchError((error) {});
  }

  /* editarProducto(BodegaProducto producto) {
    Get.toNamed('/editar_producto', arguments: [producto]);
  } */
}