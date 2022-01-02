

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Menú Principal"),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    color: Colors.teal,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                       
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                Navigator.pushNamed(context,'/lista_bodegas');
                              },
                              child: Text("Lista de bodegas")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red),
                              onPressed: () {
                                Get.toNamed('/consulta_stock');
                              },
                              child: Text("Consultar Stock")),
                        ],
                      ),
                    ),
                  ),

                  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue),
                              onPressed: () {
                                Get.toNamed('/login');
                              },
                              child: Text("Cerrar sessión")),
                ],
              ),
            ),
          )
        ])));
        }
    );
  }
}
