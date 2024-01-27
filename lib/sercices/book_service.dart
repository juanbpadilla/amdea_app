import 'dart:convert';

import 'package:amdea_app/models/libro.dart';
import 'package:amdea_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookService extends ChangeNotifier {
  final String _baseUrl = AppConstants.baseUrl;
  final String _accept = "application/vnd.api+json";

  Uri uri(_baseUrl, link) => Uri.http(_baseUrl, link);
  // Uri uri(_baseUrl, link) => Uri.https(_baseUrl, link);

  List<Libro> libros = [];
  bool isLoading = true;

  BookService() {
    print('BookService inicializado');

    // getOnDisplayArticles();
    loadLibros();
  }

  Future<List<Libro>?> loadLibros() async {

    isLoading = true;
    notifyListeners();

    final url = uri(_baseUrl, '/api/v1/books');
    final response = await http.get( url, headers: { 'Accept': _accept } );

    if ( response.statusCode != 200 ) {
      // ignore: avoid_print
      isLoading = false;
      notifyListeners();
      print('error');
      return null;
    }
    
    List<dynamic> jsonResponseList = jsonDecode(response.body);

    libros = jsonResponseList.map((map) => Libro.fromJson(map)).toList();

    print(response.body);
    print(libros[0].title);
    print(libros.length);

    isLoading = false;
    notifyListeners();

    return libros;
  }
}