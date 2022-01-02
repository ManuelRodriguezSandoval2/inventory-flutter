import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login2/login_api.dart';
import 'package:get/get.dart';

import 'usuario_model.dart';

class LoginController extends GetxController {

  String estado="";
  String estado1="0";
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController get usuarioController => _usuarioController;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  Usuario? _usuarioLogin;
  Usuario? get usuarioLogin => _usuarioLogin;
  set usuarioLogin(Usuario? value) {
    _usuarioLogin = value;
    update();
  }

  iniciarSesion() async {
    
    await LoginApi.instance
        .login(usuarioController.text, passwordController.text)
        .then((value) {
      if (value != null) {
       /*  int? edad = int.parse(usuarioLogin!.usuario!.estado); */
        usuarioLogin = value;
         estado=usuarioLogin!.usuario!.estado.toString();
        if (identical(estado, estado1)) {
          /* Get.snackbar(" ", "Estas desactivado!",
          colorText: Colors.black, backgroundColor: Colors.blue[200]); */
          Get.toNamed('/bloqueado');
        } else {
          print("activado");
          Get.toNamed('/home');
        }
        // print(usuarioLogin!.usuario!.estado);
        
      }
    }).catchError((error) {
      Get.snackbar(" ", error.toString(),
          colorText: Colors.black, backgroundColor: Colors.red);
      // print(error.toString());
    });
  }
}
