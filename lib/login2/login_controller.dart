import 'package:flutter/cupertino.dart';
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
        Get.toNamed('/lista_bodegas');
      }
    }).catchError((error) {
      Get.snackbar("asd", error.toString());
    });
  }
}
