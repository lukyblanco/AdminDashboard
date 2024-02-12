import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromJson(response);
    categorias = [...categoriesResponse.categorias];
    // print(categorias);
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {"nombre": name};

    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromJson(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw 'Error creando la Categoría';
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {"nombre": name};

    try {
      await CafeApi.httpPut('/categorias/$id', data);

      categorias = categorias.map((cat) {
        if (cat.id != id) {
          return cat;
        } else {
          cat.nombre = name;
          return cat;
        }
      }).toList();

      notifyListeners();
    } catch (e) {
      throw 'Error actualizando la Categoría';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id', {}); //como espera un segundo argumento, mando areglo vacio

      // para no hacer otra petitcion y traer la nueva lista,
      // removemos la categoria eliminada de la lista de categorias
      categorias.removeWhere((cat) => cat.id == id);

      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print('Error Eliminando');
    }
  }
}
