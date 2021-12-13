import 'package:flutter_application_1/crear_producto/crear_producto_page.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/inicio/bodega/page/bodega_page.dart';
import 'package:flutter_application_1/inicio/consultar_stock/page/consulta_stock_page.dart';
import 'package:flutter_application_1/inicio/editar_producto/editar_producto_page.dart';
import 'package:flutter_application_1/inicio/inicio_page.dart';
import 'package:flutter_application_1/inicio/inventario/pages/inventario_page.dart';
import 'package:flutter_application_1/inicio/producto_por_bodega/page/bodega_producto_page.dart';
import 'package:flutter_application_1/login2/login_page.dart';
import 'package:get/route_manager.dart';

routes() => [
      //Rutas generales
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/inicio',
        page: () => InicioPage(),
      ),
      GetPage(
        name: '/crear_producto',
        page: () => CrearProductoPage(),
      ),
      GetPage(
        name: '/editar_producto',
        page: () => EditarProductoPage(),
      ),

      GetPage(
        name: '/lista_bodegas',
        page: () => BodegaPage(),
      ),

      GetPage(
        name: '/lista_bodegas_productos',
        page: () => BodegaProductoPage(),
      ),

      GetPage(
        name: '/consulta_stock',
        page: () => ConsultaStockPage(),
      ),

      GetPage(
        name: '/realizar_inventario',
        page: () => MyApp(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
      ),
    ];
