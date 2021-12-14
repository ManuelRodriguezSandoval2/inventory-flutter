import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/bodega/controller/bodega_controller.dart';
import 'package:flutter_application_1/inicio/controllers/inicio_controller.dart';
import 'package:flutter_application_1/inicio/producto_por_bodega/controller/bodega_producto_controller.dart';
import 'package:get/get.dart';

class BodegaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BodegaController>(
        init: BodegaController(),
        builder: (_) {
          //   _.obtenerBodegas();

          return Scaffold(
              appBar: AppBar(title: Text("Menú Bodegas"),
              backgroundColor: Colors.green,
              ),
              body: Container(
                  color:Colors.blueAccent,
                child: Column(children: [
                  /* Text("Lista de bodegas"), */
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        _.obtenerBodegas();
                      },
                      child: Text("Listar Bodegas")),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 600.0,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _.bodegas.length,
                                  itemBuilder: (context, i) {
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
                                                  "Ciudad:    ${_.bodegas[i].nombreCiudad}"),
                                              Text(
                                                  "Bodega: ${_.bodegas[i].nombreBodega}"),
                                              Text(
                                                  "Dirección: ${_.bodegas[i].direccion}"),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.red),
                                                  onPressed: () {
                                                    _.obtenerBodegasProductos(
                                                        _.bodegas[i].idBodega);
                                                        

                                                    Get.toNamed(
                                                        '/lista_bodegas_productos');
                                                  },
                                                  child: Text(
                                                      "Ingresar a bodega"))
                                            ],
                                            
                                          ),
                                        ),
                                      ),
                                      
                                    );

                                    
                                  })))
                    ],
                  ),

                 
                                               
                ]),
              ));
        });
  }
}
