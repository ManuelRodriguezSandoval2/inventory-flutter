import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login2/login_api.dart';
import 'package:get/get.dart';

import 'usuario_model.dart';

class LoginController extends GetxController {
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
        usuarioLogin = value;
        //Navegar menu
        Get.toNamed('/home');
      }
    }).catchError((error) {
      Get.snackbar(" ", error.toString(),
      colorText:Colors.black,
      backgroundColor: Colors.red);
     // print(error.toString());
    });
  }
}
