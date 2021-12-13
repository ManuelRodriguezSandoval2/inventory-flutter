// To parse this JSON data, do
//
//     final producto = bodegaFromJson(jsonString);

import 'dart:convert';

List<Bodega> bodegaFromJson(String str) =>
    List<Bodega>.from(json.decode(str).map((x) => Bodega.fromJson(x)));

String bodegaToJson(List<Bodega> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bodega {
  Bodega({
        this.idBodega,
        this.nombreCiudad,
        this.direccion,
        this.nombreBodega,
  });

    int? idBodega;
    String? nombreCiudad;
    String? direccion;
    String? nombreBodega;

  factory Bodega.fromJson(Map<String, dynamic> json) => Bodega(

        idBodega: json["id_bodega"] == null ? null : json["id_bodega"],
        nombreCiudad: json["nombre_ciudad"] == null ? null : json["nombre_ciudad"],
        direccion: json["direccion"] == null ? null : json["direccion"],
        nombreBodega: json["nombre_bodega"] == null ? null : json["nombre_bodega"],
      );

  Map<String, dynamic> toJson() => {
        "id_bodega":     idBodega == null ? null : idBodega,
        "nombre_ciudad": nombreCiudad == null ? null : nombreCiudad,
        "direccion": direccion == null ? null : direccion,
        "nombre_bodega": nombreBodega == null ? null : nombreBodega,
      };
}