import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/bodega/controller/bodega_controller.dart';
import 'package:flutter_application_1/inicio/controllers/inicio_controller.dart';
import 'package:get/get.dart';

class BodegaProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BodegaController>(
        init: BodegaController(),
        builder: (_) {
          //  _.obtenerBodegas();
          return Scaffold(
              appBar: AppBar(
                title: Text("Productos almacenados"),
              ),
              body: Container(
                color:Colors.orangeAccent,
                child: Column(children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        Get.toNamed('/realizar_inventario');
                      },
                      child: Text("Realizar Inventario")),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 600.0,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _.bodegasxproductos.length,
                                  itemBuilder: (context, i) {
                                    // if (_.bodegasxproductos.length > 0) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Card(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Bodega:    ${_.bodegasxproductos[i].nombreBodega}"),
                                              Text(
                                                  "Producto: ${_.bodegasxproductos[i].nombreProducto}"),
                                              Text(
                                                  "Cantidad: ${_.bodegasxproductos[i].cantidad}"),

                                              /* ElevatedButton(
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        '/inicio');
                                                  },
                                                  child:
                                                      Text("Productos almacenados")) */
                                            ],
                                          ),
                                        ),
                                      ),
                                    );

                                    /* } else {

                                      return InkWell(
                                        onTap: () {},
                                        child: Card(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "Esta bodega no contiene elementos"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } */
                                  })))
                    ],
                  ),
                ]),
              ));
        });
  }
}
