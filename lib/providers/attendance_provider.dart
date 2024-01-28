import 'dart:convert';

import 'package:amdea_app/models/attendance.dart';
import 'package:amdea_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AttendanceProvider extends ChangeNotifier {
  final String _baseUrl = AppConstants.baseUrl;
  final String _accept = "application/json";

  List<Attendance> _attendances = [];
  late Attendance attendance;

  List<Attendance> get attendances => _attendances;

  bool isLoading = true;

  final storage = const FlutterSecureStorage();

  Uri uri(_baseUrl, link) => Uri.http(_baseUrl, link);
  // Uri uri(_baseUrl, link) => Uri.https(_baseUrl, link);

  AttendanceProvider() {
    print('Attendance Inicializado');

    showAttendances();
  }

  Future<List<Attendance>?> showAttendances() async {    
    print('Attendance Inicializado');
    isLoading = true;
    notifyListeners();
    final idToken = await storage.read(key: 'token');
    final url = uri(_baseUrl, '/api/v1/user/attendances');

    final resp = await http.get(url, headers: { 
      'Accept': _accept,
      'Authorization': 'Bearer $idToken',
    });

    if (resp.statusCode != 200) {
      print('error');
      isLoading = false;
      notifyListeners();
      return null;
    }

    attendances.clear();
    _attendances.clear();

    List<dynamic> jsonResponseList = jsonDecode(resp.body);
    print(jsonResponseList.length);
    final number = jsonResponseList.length - 1;
    for(int i = number; i >= 0; i--){
      String aux = jsonEncode(jsonResponseList[i]);
      attendance = Attendance.fromJson(aux);
      // print(attendance.lesson.lesson);
      // attendances.add(attendance);
      _attendances.add(attendance);
    }

    isLoading = false;
    notifyListeners();

    return attendances;
  }

  Future<void> updateAttended( String id, int attended ) async {

    print(id);
    isLoading = true;
    notifyListeners();
    final idToken = await storage.read(key: 'token');

    final Map<String, dynamic> data = {
      'attended': attended.toString()
    };

    final url = uri(_baseUrl, '/api/v1/users/attendance/update/$id');

    final resp = await http.patch(url, headers: { 
      'Accept': _accept,
      'Authorization': 'Bearer $idToken',
    }, body: data );

    final decodedResp = json.decode( resp.body );

    print(resp.body);
    print(decodedResp['id']);
    final number = attendances.length;
    for(int i = 0; i < number; i++){
      if(_attendances[i].id == decodedResp['id']){
        _attendances[i].attended = decodedResp['id'];
        notifyListeners();
      }
    }

    isLoading = false;
    notifyListeners();
  }
}