import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/editar_producto/controllers/editar_producto_controller.dart';
import 'package:get/get.dart';

class EditarProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditarProductoController>(
        init: EditarProductoController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Editar producto"),
            ),
            body: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _.nombreController,
                  ),
                  TextField(
                    controller: _.precioController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                       /*  _.actualizarProducto(); */
                      },
                      child: Text("Actualizar"))
                ],
              ),
            ),
          );
        });
  }
}
