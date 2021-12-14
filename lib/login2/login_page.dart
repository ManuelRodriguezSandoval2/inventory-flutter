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
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text("Inventory Soft"),
              ),
              body: Container(
                  child: Stack(children: <Widget>[
                ///////////  background///////////
                new Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.4, 0.9],
                      colors: [
                        Colors.blueGrey,
                        Colors.greenAccent,
                        Colors.blueAccent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 4.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextField(
                                controller: _.usuarioController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.people),
                                    hintText: "Usuario"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _.passwordController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Contraseña"),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () {
                                    _.iniciarSesion();
                                  },
                                  child: Text("Ingresar"))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ])));
        });
  }
}
