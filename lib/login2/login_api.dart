import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter/material.dart';

import 'usuario_model.dart';

class LoginApi {
  LoginApi._internal();
  static LoginApi _instance = LoginApi._internal();
  static LoginApi get instance => _instance;

  Future<Usuario?> login(String username, String password) async {
    String? url = "http://10.0.2.2:8000/api/login";
    Response response;
    Dio dio = new Dio();
    dio.options.headers["Accept"] = "application/json";
    dio.options.responseType = ResponseType.plain;
    try {
      response = await dio.post(url, queryParameters: {
        "username": username,
        "password": password
      }).timeout(const Duration(seconds: 10));
     /*  print(response.data.toString()); */
      switch (response.statusCode) {
        case 200:
          Usuario usuario = usuarioFromJson(response.data);
        /*   print(response.data); */
          return usuario;
          
        default:
          throw Exception("Error al iniciar sesion");
      }
    } on Exception catch (e) {
      throw Exception("Error al iniciar sesion");
    }
  }
}
