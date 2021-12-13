import 'package:flutter/material.dart';
import 'package:flutter_application_1/crear_producto/controllers/crear_producto_controller.dart';
import 'package:get/get.dart';

class CrearProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrearProductoController>(
        init: CrearProductoController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Crear producto"),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _.nombreController,
                    decoration: InputDecoration(hintText: "Nombre"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _.precioController,
                    decoration: InputDecoration(hintText: "Precio"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _.crearProducto();
                      },
                      child: Text("Guardar"))
                ],
              ),
            ),
          );
        });
  }
}
