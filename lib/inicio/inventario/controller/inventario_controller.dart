import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/bodega/controller/bodega_controller.dart';
import 'package:flutter_application_1/inicio/inventario/api/inventario_api.dart';
import 'package:flutter_application_1/login2/login_controller.dart';
import 'package:get/get.dart';


String bodega="";
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
            _cantidadController.text, bodega)
        .then((value) {
          
        Get.snackbar(" ", value.toString(),
      colorText:Colors.black,
      backgroundColor: Colors.white);
      print(value);
    }).catchError((error) {});
  }

  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var _loginController = Get.find<LoginController>();
    print(_loginController.usuarioLogin!.accessToken);
    var _bodegaController = Get.find<BodegaController>();
    bodega=_bodegaController.idBodega.toString();
    //_idBodegaController=bodega.toString();
    print(bodega);
  }

  setCodigo(String codigo) {
    idProductoController.text = codigo;
    update();
  }

/*    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var _loginController = Get.find<LoginController>();
    print(_loginController.usuarioLogin!.accessToken);
  } */
}
