import 'dart:convert';

import 'package:amdea_app/models/libro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookService extends ChangeNotifier {
  // final String _baseUrl = "10.0.2.2:8000";
  final String _baseUrl = "790b-2800-cd0-df4f-1600-c54c-6ee-376a-d1c9.ngrok-free.app";

  List<Libro> libros = [];
  bool isLoading = true;

  BookService() {
    print('BookService inicializado');

    // getOnDisplayArticles();
    loadLibros();
  }

  Future<List<Libro>?> loadLibros() async {

    // isLoading = true;
    // notifyListeners();

    // final url = Uri.http(_baseUrl, '/api/books');
    final url = Uri.https(_baseUrl, '/api/books');
    final response = await http.get( url );

    if ( response.statusCode != 200 ) {
      // ignore: avoid_print
      print('error');
      return null;
    }
    
    List<dynamic> jsonResponseList = jsonDecode(response.body);

    libros = jsonResponseList.map((map) => Libro.fromJson(map)).toList();

    print(response.body);
    print(libros[0].title);
    print(libros.length);

    // isLoading = false;
    // notifyListeners();

    return libros;
  }
}