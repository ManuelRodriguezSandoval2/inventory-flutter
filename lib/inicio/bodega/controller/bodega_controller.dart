
import 'package:flutter_application_1/inicio/bodega/api/bodega_api.dart';
import 'package:flutter_application_1/inicio/producto_por_bodega/api/bodega_api.dart';
import 'package:flutter_application_1/models/bodega_model.dart';
import 'package:flutter_application_1/models/bodega_producto_model.dart';
import 'package:get/get.dart';

class BodegaController extends GetxController {
  List<Bodega> _bodegas = [];
  List<Bodega> get bodegas => _bodegas;
  set bodegas(List<Bodega> data) {
    _bodegas = data;
    update();

  }
    List<BodegaProducto> _bodegasxproductos = [];
  List<BodegaProducto> get bodegasxproductos => _bodegasxproductos;
  set bodegasxproductos(List<BodegaProducto> data) {
    _bodegasxproductos = data;
    update();
  }

  obtenerBodegas() async {
    await BodegaApi.instance.consultaBodegaAPi().then((data) {
      if (data != null) {
        bodegas = data;
      }
    }).catchError((error) {});
  }

  obtenerBodegasProductos(int? bodegaproducto) async {
    await BodegaProductoApi.instance.consultaBodegaProductoAPi(bodegaproducto).then((data) {
      if (data != null) {
        bodegasxproductos = data;
        print(bodegasxproductos);
      }
    }).catchError((error) {});
  }

  /* editarProducto(Bodega producto) {
    Get.toNamed('/editar_producto', arguments: [producto]);
  } */
}