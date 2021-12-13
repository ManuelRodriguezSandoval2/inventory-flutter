import 'package:flutter/material.dart';
import 'package:flutter_application_1/login2/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _.usuarioController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people), hintText: "Usuario"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _.passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock), hintText: "Contraseña"),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent),
                      onPressed: () {
                        _.iniciarSesion();
                      },
                      child: Text("Ingresar"))
                ],
              ),
            ),
          );
        });
  }
}
