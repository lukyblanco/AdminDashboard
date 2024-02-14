// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

import '../usuario.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    Usuario usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token,
    });

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario.toJson(),
        "token": token,
    };
}


