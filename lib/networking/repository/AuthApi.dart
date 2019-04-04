import '../../utils/BaseHttp.dart';
import '../../pojo/AuthResponse.dart';
import '../../pojo/SesionResponse.dart';
import 'dart:async';
import 'dart:convert';

class Auth implements AuthRepository {
  Future<RequestToken> getRequestToken() async {
    final response = await baseGet("/authentication/token/new");
    return RequestToken.fromJson(json.decode(response.body));
  }

  @override
  Future<SessionResponse> createGuestSession() async {
    final response = await baseGet("/authentication/guest_session/new");
    return SessionResponse.fromJson(json.decode(response.body));
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

    return RequestToken.fromJson(json.decode(response.body));
  }
}

abstract class AuthRepository {
  Future<RequestToken> getRequestToken();

  Future<SessionResponse> createGuestSession();

  Future<RequestToken> signIn(String login, String password);
}
