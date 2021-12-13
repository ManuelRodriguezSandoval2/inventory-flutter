import 'dart:convert';

List<Inventario> inventarioStockFromJson(String str) =>
    List<Inventario>.from(json.decode(str).map((x) => Inventario.fromJson(x)));

String inventarioStockToJson(List<Inventario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventario {
  Inventario({
        this.idProducto,
        this.idBodega,
        this.cantidad,
  });
    int? idProducto;
    int? idBodega;
    int? cantidad;

  factory Inventario.fromJson(Map<String, dynamic> json) => Inventario(

        idProducto: json["id_producto"] == null ? null : json["id_producto"],
        idBodega: json["id_bodega"] == null ? null : json["id_bodega"],
        cantidad: json["cantidad"] == null ? null : json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "id_producto":     idProducto == null ? null : idProducto,
        "id_bodega": idBodega == null ? null : idBodega,
        "cantidad": cantidad == null ? null : cantidad,
      };
}