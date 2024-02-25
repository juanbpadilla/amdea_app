import 'dart:developer';

import 'package:amdea_app/models/list_topics.dart';
import 'package:amdea_app/models/topic.dart';
import 'package:amdea_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TopicService extends ChangeNotifier {

  final String _baseUrl = AppConstants.baseUrl;
  final String _accept = "application/vnd.api+json";

  late ListTopics listTopics;
  List<Topic> topics = [];

  final storage = const FlutterSecureStorage();
  bool isLoading = true;

  Uri uri(
      {required String bUrl,
      required String link,
      String? filter,
      String? id}) {
    Map<String, String> queryParams = {};
    if (filter != null) {
      queryParams['filter[$filter]'] = id!;
    }
    // return Uri.http(bUrl, link, queryParams);
    return Uri.https(_baseUrl, link, queryParams);
  }

  Future<List<Topic>?> showtopics() async {
    log('ShowTopics Inicializado');
    isLoading = true;
    notifyListeners();
    // final idToken = await storage.read(key: 'token');
    final url = uri(bUrl: _baseUrl, link: '/api/v1/topics');

    final resp = await http.get(url, headers: {
      'Accept': _accept,
      // 'Authorization': 'Bearer $idToken',
    });

    print('Response body ${resp.body}');
    if (resp.statusCode != 200) {
      log('error');
      isLoading = false;
      notifyListeners();
      return null;
    }

    final listTopics = ListTopics.fromJson(resp.body);
    topics = listTopics.data;

    print('LONGITUD: ${topics.length}');

    isLoading = false;
    notifyListeners();

    return topics;
  }
}