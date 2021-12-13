import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Menú Principal"),
        ),
        body: Container(
            child: Stack(children: <Widget>[
          ///////////  background///////////
          new Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.5, 0.9],
                colors: [
                  Colors.orangeAccent,
                  Colors.orange,
                  Colors.deepOrange,
                ],
              ),
            ),
          ),

          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    color: Colors.teal,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  primary: Colors.lime),
                              onPressed: () {
                                Get.toNamed('/consulta_stock');
                              },
                              child: Text("Consultar Stock")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}
