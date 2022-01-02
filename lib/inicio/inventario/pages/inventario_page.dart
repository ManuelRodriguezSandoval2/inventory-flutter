import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/inicio/inventario/controller/inventario_controller.dart';
import 'package:flutter_application_1/inicio/inventario/pages/qr_page.dart';
import 'package:get/get.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Inicio());
  }
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String? codigoQR = 'Aún no se ha escaneado un código...';

  bool estadoQR = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IngresarInventarioController>(
        init: IngresarInventarioController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                /* 
          leading: Icon(Icons.qr_code), */
                title: Text('Módulo de inventario'),
                titleSpacing: 0,
              ),
              body: Stack(
                children: [
                  Container(
                      color: Colors.blue[300],
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: SingleChildScrollView(
                                child: Text(
                                  _.idProductoController.text,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: (!estadoQR)
                                          ? Colors.black
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),

                          /*  */
                          // ignore: deprecated_member_use
                          RaisedButton(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            onPressed: () async {
                              codigoQR = await scanner.scan();
                              //_.idProductoController.text = cameraScanResult!;
                              _.setCodigo(codigoQR!);
                              print(codigoQR);
                            },
                            child: Text(
                              'ESCANEAR',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 7.0),
                            ),
                          ),

                          TextFormField(
                            keyboardType: TextInputType.number,
                            
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            controller: _.cantidadController,
                            decoration: const InputDecoration(
                              hintText: 'Ingrese cantidad de productos',
                            ),
                          ),

                          ElevatedButton(
                            
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                
                                _.ingresarInventario();
                              },
                              child: Text("Registrar")),
                        ],
                      )),
                ],
              ));
        });
  }

/**
 * Esta función permite navegar a la pantalla del scanner y esperar el resultado para mostrarlo
 */
  /* _navegarAlEscanner(BuildContext context) async {
    this.codigoQR = 'Aún no se ha escaneado un código...';
    this.estadoQR = false;
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRPAGE()),
    );
    setState(() {
      if (result != null) {
        this.codigoQR = result;
        this.estadoQR = true;
      }
    });
  } */
}
