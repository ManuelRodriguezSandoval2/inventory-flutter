// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  Producto({
        this.nombreProducto,
        this.nombreBodega,
        this.cantidad,
  });

    String? nombreProducto;
    String? nombreBodega;
    String? cantidad;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        nombreProducto: json["nombre_producto"] == null ? null : json["nombre_producto"],
        nombreBodega: json["nombre_bodega"] == null ? null : json["nombre_bodega"],
        cantidad: json["cantidad"] == null ? null : json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "nombre_producto":     nombreProducto == null ? null : nombreProducto,
        "nombre_bodega": nombreBodega == null ? null : nombreBodega,
        "cantidad": cantidad == null ? null : cantidad,
      };
}
