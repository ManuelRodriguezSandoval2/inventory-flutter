import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloqueadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("No disponible"),
        ),
        body: Container(
            color: Colors.green,
            child: Stack(children: <Widget>[
              ///////////  background///////////
              new Container(
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.0, 0.5, 0.9],
                    colors: [
                      Colors.white38,
                      Colors.white,
                      Colors.white10,
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
                      margin: EdgeInsets.only(left: 50, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Usuario se encuentra inactivo,',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'por favor contáctese con el administrador',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'del sistema',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue),
                                onPressed: () {
                                  Get.toNamed('/login');
                                },
                                child: Text("Salir")),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ])));
  }
}
