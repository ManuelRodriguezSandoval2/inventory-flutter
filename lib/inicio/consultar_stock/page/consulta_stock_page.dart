import 'package:flutter/material.dart';
import 'package:flutter_application_1/inicio/consultar_stock/controller/consulta_stock_controller.dart';
import 'package:get/get.dart';

class ConsultaStockPage extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConsultaStockController>(
        init: ConsultaStockController(),
        builder: (_) {
          //  _.obtenerBodegas();
          return new Scaffold(
            
              appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text("Consultar stock")),
              body: Container(
                  color: Colors.blue[200],
                
                child: Column(children: [
                  TextFormField(
                    controller: myController,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese código o nombre del producto',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Debe ingresar un código o nombre del producto que desea encontrar';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _.obtenerStockProductos(myController.text);
                        myController.text = "";
                      },
                      child: Text("Consultar")),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: SizedBox(
                              height: 600.0,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _.consultastock.length,
                                  itemBuilder: (context, i) {
                                    // ignore: unrelated_type_equality_checks

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
                                                  "Bodega:    ${_.consultastock[i].nombreBodega}"),
                                              Text(
                                                  "Producto: ${_.consultastock[i].nombreProducto}"),
                                              Text(
                                                  "Cantidad: ${_.consultastock[i].cantidad}"),

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
