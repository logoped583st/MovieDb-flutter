class RequestToken {
  final bool success;
  final String requestToken;
  final String expiresAt;

  RequestToken({this.success, this.requestToken, this.expiresAt});

  factory RequestToken.fromJson(Map<String, dynamic> json) {
    return RequestToken(
        success: json['success'],
        requestToken: json['request_token'],
        expiresAt: json['expires_at']);
  }
}
