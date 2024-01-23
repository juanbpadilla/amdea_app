import 'dart:convert';

import 'package:amdea_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {

  final String _baseUrl = "10.0.2.2:8000";
  // final String _baseUrl = AppConstants.baseUrl;
  final String _accept = "application/json";

  final storage = const FlutterSecureStorage();

  Future<String?> createUser(
    String name, String email, String password, String passwordConfirmation,
  ) async {
    final Map<String, dynamic> authData = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'device_name': 'deviceName-$name'
    };
    final url = Uri.http(_baseUrl, '/api/v1/register');
    // final url = Uri.https(_baseUrl, '/api/v1/register');
    final resp = await http.post(url, headers: { 'Accept': _accept }, body: authData);
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    if ( decodedResp.containsKey('plain-text-token') ) {
      await storage.write(key: 'token', value: decodedResp['plain-text-token']);
      return null;
    } else {
      return decodedResp['message'];
    }
  }

  Future<String?> login(
    String username, String password,
  ) async {
    final Map<String, dynamic> authData = {
      // 'email': email,
      'username': username,
      'password': password,
      'device_name': 'deviceName-phone'
    };
    final url = Uri.http(_baseUrl, '/api/v1/login');
    // final url = Uri.https(_baseUrl, '/api/v1/login');
    final resp = await http.post(url, headers: { 'Accept': _accept }, body: authData);
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    if ( decodedResp.containsKey('plain-text-token') ) {
      await storage.write(key: 'token', value: decodedResp['plain-text-token']);
      return null;
    } else {
      return decodedResp['message'];
    }
  }

  Future<User> show() async {

    final idToken = await storage.read(key: 'token');

    final url = Uri.http(_baseUrl, '/api/v1/user');
    // final url = Uri.https(_baseUrl, '/api/v1/user');

    final resp = await http.get(url, headers: { 
      'Accept': _accept,
      'Authorization': 'Bearer $idToken',
    });

    final decodedResp = json.decode( resp.body );

    if (resp.statusCode == 401) {
      logout();
    }

    User user = User.fromMap(decodedResp);

    return user;
  }

  Future<String> permissionShow(String id) async {

    final idToken = await storage.read(key: 'token');

    final url = Uri.http(_baseUrl, '/api/v1/permission/$id');
    // final url = Uri.https(_baseUrl, '/api/v1/user');

    final resp = await http.get(url, headers: { 
      'Accept': "application/vnd.api+json",
      'Authorization': 'Bearer $idToken',
    });

    final decodedResp = json.decode( resp.body );

    if (resp.statusCode == 401) {
      return 'error';
    }
    print(decodedResp[0].toString());
    // User user = User.fromMap(decodedResp);

    return decodedResp[0].toString();
  }

  Future<User?> updateUser( User user ) async {
    final idToken = await storage.read(key: 'token');

    print(user.id);
    print(idToken);

    final Map<String, dynamic> authData = {
      'email': user.email,
      'phone': user.phone
    };

    final url = Uri.http(_baseUrl, '/api/v1/update/${user.id}');

    final resp = await http.patch(url, headers: { 
      'Accept': _accept,
      'Authorization': 'Bearer $idToken',
    }, body: authData );

    final decodedResp = json.decode( resp.body );

    print(resp.body);

    if (resp.statusCode == 401) {
      print('error al guardar!');
      return user;
    }

    User userUpdated = User.fromMap(decodedResp);

    return userUpdated;
  }

  Future<String?> updatePassword( String id, String old_password, String password, String passwordConfirmation ) async {
    // final idToken = await storage.read(key: 'token');

    print(id);
    // print(idToken);

    final Map<String, dynamic> authData = {
      'old_password': old_password,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'device_name': 'deviceName-phone'
    };

    final url = Uri.http(_baseUrl, '/api/v1/user/$id/update-password');

    final resp = await http.put(url, headers: { 
      'Accept': _accept,
      // 'Authorization': 'Bearer $idToken',
    }, body: authData );

    // final decodedResp = json.decode( resp.body );

    print(resp.body);
    final Map<String, dynamic> decodedResp = json.decode( resp.body );
    if ( decodedResp.containsKey('plain-text-token') ) {
      await storage.write(key: 'token', value: decodedResp['plain-text-token']);
      return null;
    } else {
      return decodedResp['message'];
    }
  }

  Future logout() async {

    final idToken = await storage.read(key: 'token');
    final url = Uri.http(_baseUrl, '/api/v1/logout');
    // final url = Uri.https(_baseUrl, '/api/v1/logout');

    final resp = await http.post(url, headers: { 
      'Accept': _accept,
      'Authorization': 'Bearer $idToken',
    });

    // final Map<String, dynamic> decodedResp = json.decode( resp.body );

    print(resp.statusCode);

    if ( resp.statusCode == 204 ) {
      await storage.delete(key: 'token');
      return;
    } else {
      await storage.delete(key: 'token');
    }

  }

  Future<String> readToken() async {

    return await storage.read(key: 'token') ?? '';

  }

}