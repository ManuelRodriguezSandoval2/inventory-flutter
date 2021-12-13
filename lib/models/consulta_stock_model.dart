// To parse this JSON data, do
//
//     final producto = bodegaFromJson(jsonString);

import 'dart:convert';

List<ConsultaStock> consultaStockFromJson(String str) =>
    List<ConsultaStock>.from(json.decode(str).map((x) => ConsultaStock.fromJson(x)));

String consultaStockToJson(List<ConsultaStock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConsultaStock {
  ConsultaStock({
        this.idProducto,
        this.nombreProducto,
        this.nombreBodega,
        this.cantidad,
  });
    int? idProducto;
    String? nombreProducto;
    String? nombreBodega;
    String? cantidad;

  factory ConsultaStock.fromJson(Map<String, dynamic> json) => ConsultaStock(

        idProducto: json["id_producto"] == null ? null : json["id_producto"],
        nombreProducto: json["nombre_producto"] == null ? null : json["nombre_producto"],
        nombreBodega: json["nombre_bodega"] == null ? null : json["nombre_bodega"],
        cantidad: json["cantidad"] == null ? null : json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_producto":     idProducto == null ? null : idProducto,
        "nombre_producto":     nombreProducto == null ? null : nombreProducto,
        "nombre_bodega": nombreBodega == null ? null : nombreBodega,
        "cantidad": cantidad == null ? null : cantidad,
      };
}