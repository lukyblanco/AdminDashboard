// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

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

class Usuario {
    String rol;
    bool estado;
    bool google;
    String nombre;
    String correo;
    String uid;

    Usuario({
        required this.rol,
        required this.estado,
        required this.google,
        required this.nombre,
        required this.correo,
        required this.uid,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
    };
}
