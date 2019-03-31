import '../utils/BaseHttp.dart';
import '../pojo/AuthResponse.dart';
import '../pojo/SesionResponse.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Auth implements AuthRepository {
  Future<RequestToken> getRequestToken() async {
    final response = await baseGet("/authentication/token/new");

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return RequestToken.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      debugPrint(response.statusCode.toString());
      return null;
    }
  }

  @override
  Future<SessionResponse> createGuestSession() async {
    final response = await baseGet("/authentication/guest_session/new");

    if (response.statusCode == 200) {
      return SessionResponse.fromJson(json.decode(response.body));
    } else {
      debugPrint(response.statusCode.toString());
      return null;
    }
  }

  @override
  Future<RequestToken> signIn(String login, String password) async {
    RequestToken requestToken = await getRequestToken();

    final response =
        await basePost("/authentication/token/validate_with_login", body: {
      "username": login,
      "password": password,
      "request_token": requestToken.requestToken
    });

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return RequestToken.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      debugPrint(response.statusCode.toString());
      return null;
    }
  }
}

abstract class AuthRepository {
  Future<RequestToken> getRequestToken();

  Future<SessionResponse> createGuestSession();

  Future<RequestToken> signIn(String login, String password);
}
