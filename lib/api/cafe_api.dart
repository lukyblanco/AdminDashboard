import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  //* GET 
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el GET');
    }
  }

  //* POST
  static Future httpPost(String path, Map<String, dynamic> data) async {
    // no puedo pasar la data "cruda" la hacemos un objeto
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el POST');
    }
  }

    //* PUT (actualizar)
  static Future httpPut(String path, Map<String, dynamic> data) async {
    // no puedo pasar la data "cruda" la hacemos un objeto
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el PUT');
    }
  }
  
  //* DELETE
  static Future httpDelete(String path, Map<String, dynamic> data) async {
    // no puedo pasar la data "cruda" la hacemos un objeto
    final formData = FormData.fromMap(data);

    try {
      final response = await _dio.delete(path, data: formData);
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el DELETE');
    }
  }

}



