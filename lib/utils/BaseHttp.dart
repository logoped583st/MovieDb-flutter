import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../networking/errors/Errors.dart';

const String _apiKey = "8a804ccd6e2b680e77ab60f86dc27bb6";

const String _baseUrl = "api.themoviedb.org";

const String _basePath = "/3";

Map<String, String> apiKeyMap = {"api_key": _apiKey};

Future<Response> baseGet(String url,
    {Map<String, String> headers: const {},
      String authToken: "",
      Map<String, String> query: const {}}) async {
  if (authToken.isNotEmpty) {
    headers.addAll({HttpHeaders.authorizationHeader: authToken});
  }

  apiKeyMap.addAll(query);
  Uri finalUrl = Uri.https(_baseUrl, _basePath + url, apiKeyMap);

  Response response = await get(
    finalUrl,
    headers: headers,
  ).then((response) {
    httpLog(response);
    return response;
  }).timeout(Duration(seconds: 5));


  return response;
}

Future<Response> basePost(String url,
    {Map<String, String> headers,
      dynamic body,
      String authToken: "",
      Map<String, String> query: const {}}) async {
  Uri finalUrl = Uri.https(_baseUrl, _basePath + url, apiKeyMap);

  if (authToken.isNotEmpty) {
    headers.addAll({HttpHeaders.authorizationHeader: authToken});
  }

  Future<Response> response = post(
    finalUrl,
    headers: headers,
    body: body,
  ).then((response) {
    httpLog(response);
    return response;
  }).timeout(Duration(seconds: 5));

  return response;
}

void httpLog(Response response, {dynamic body}) {
  debugPrint(
      "Request: ${response.request} Code: ${response
          .statusCode} Response: ${response.body}, Body: ${body}");
}
