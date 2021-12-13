// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.usuario,
  });

  String? accessToken;
  String? tokenType;
  DateTime? expiresAt;
  UsuarioClass? usuario;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
        usuario: json["usuario"] == null
            ? null
            : UsuarioClass.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_at": expiresAt == null ? null : expiresAt!.toIso8601String(),
        "usuario": usuario == null ? null : usuario!.toJson(),
      };
}

class UsuarioClass {
  UsuarioClass({
    this.idUsuario,
    this.rut,
    this.username,
    this.email,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.direccion,
    this.tipoPermiso,
    this.estado,
    this.idCiudad,
    this.createdAt,
    this.updatedAt,
  });

  int? idUsuario;
  String? rut;
  String? username;
  String? email;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? direccion;
  String? tipoPermiso;
  String? estado;
  int? idCiudad;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UsuarioClass.fromJson(Map<String, dynamic> json) => UsuarioClass(
        idUsuario: json["id_usuario"] == null ? null : json["id_usuario"],
        rut: json["rut"] == null ? null : json["rut"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        apellidoPaterno:
            json["apellido_paterno"] == null ? null : json["apellido_paterno"],
        apellidoMaterno:
            json["apellido_materno"] == null ? null : json["apellido_materno"],
        direccion: json["direccion"] == null ? null : json["direccion"],
        tipoPermiso: json["tipo_permiso"] == null ? null : json["tipo_permiso"],
        estado: json["estado"] == null ? null : json["estado"],
        idCiudad: json["id_ciudad"] == null ? null : json["id_ciudad"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario == null ? null : idUsuario,
        "rut": rut == null ? null : rut,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "nombre": nombre == null ? null : nombre,
        "apellido_paterno": apellidoPaterno == null ? null : apellidoPaterno,
        "apellido_materno": apellidoMaterno == null ? null : apellidoMaterno,
        "direccion": direccion == null ? null : direccion,
        "tipo_permiso": tipoPermiso == null ? null : tipoPermiso,
        "estado": estado == null ? null : estado,
        "id_ciudad": idCiudad == null ? null : idCiudad,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
