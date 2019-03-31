class SessionResponse {
  final bool success;
  final String guestSessionId;
  final String expireAt;

  SessionResponse({this.success, this.guestSessionId, this.expireAt});

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
        success: json['success'],
        guestSessionId: json['guest_session_id'],
        expireAt: json["expires_at"]);
  }
}
