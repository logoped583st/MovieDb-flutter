import 'dart:io';

import 'package:http/http.dart';

const String apiKey = "8a804ccd6e2b680e77ab60f86dc27bb6";

const String baseUrl = "https://api.themoviedb.org/3";

const Map<String, String> apiKeyMap = {"apiKey": apiKey};

Future<Response> baseGet(String url,
    {Map<String, String> map, String authToken}) {
  final Map<String, String> tempMap = map;
  tempMap.addAll(apiKeyMap);

  if (authToken.isNotEmpty) {
    tempMap.addAll({HttpHeaders.authorizationHeader: authToken});
  }
  return get(
    baseUrl + url,
    headers: tempMap,
  );
}

Future<Response> basePost(String url,
    {Map<String, String> map, dynamic body, String authToken}) {
  final Map<String, String> tempMap = map;
  tempMap.addAll(apiKeyMap);
  if (authToken.isNotEmpty) {
    tempMap.addAll({HttpHeaders.authorizationHeader: authToken});
  }
  return post(
    baseUrl + url,
    headers: tempMap,
  );
}
