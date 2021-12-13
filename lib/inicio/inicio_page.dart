import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/controllers/inicio_controller.dart';
import 'package:get/get.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InicioController>(
        init: InicioController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Column(
                children: [
                  Text("Consulta Stock"),

                  TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Debe ingresar un código o nombre del producto que desea encontrar';
              }
              return null;
            },
          ),
                  ElevatedButton(
                      onPressed: () {
                        _.obtenerProductos();
                      },
                      child: Text("Obtener producto")),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _.productos.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            /* print(
                                "${_.productos[i].id} 
                                ${_.productos[i].nombre!.toUpperCase()}");
                            _.editarProducto(_.productos[i]); */
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ID producto:    ${_.productos[i].nombreProducto}"),
                                  Text(
                                      "Nombre producto: ${_.productos[i].nombreBodega}"),
                                  Text(
                                      "Precio producto: ${_.productos[i].cantidad}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          );
        });
  }
}
