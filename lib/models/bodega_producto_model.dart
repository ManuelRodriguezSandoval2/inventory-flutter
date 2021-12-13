// To parse this JSON data, do
//
//     final producto = bodegaFromJson(jsonString);

import 'dart:convert';

List<BodegaProducto> bodegaProductoFromJson(String str) =>
    List<BodegaProducto>.from(json.decode(str).map((x) => BodegaProducto.fromJson(x)));

String bodegaProductoToJson(List<BodegaProducto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodegaProducto {
  BodegaProducto({
        this.idBodega,
        this.nombreProducto,
        this.nombreBodega,
        this.cantidad,
  });
    int? idBodega;
    String? nombreProducto;
    String? nombreBodega;
    String? cantidad;

  factory BodegaProducto.fromJson(Map<String, dynamic> json) => BodegaProducto(

        idBodega: json["id_bodega"] == null ? null : json["id_bodega"],
        nombreProducto: json["nombre_producto"] == null ? null : json["nombre_producto"],
        nombreBodega: json["nombre_bodega"] == null ? null : json["nombre_bodega"],
        cantidad: json["cantidad"] == null ? null : json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_bodega":     idBodega == null ? null : idBodega,
        "nombre_producto":     nombreProducto == null ? null : nombreProducto,
        "nombre_bodega": nombreBodega == null ? null : nombreBodega,
        "cantidad": cantidad == null ? null : cantidad,
      };
}