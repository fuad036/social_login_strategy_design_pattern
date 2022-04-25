
class SocialAuthResponse {
  late String email;
  late String? name;
  late String? accessToken;
  late String? photoUrl;
  late String signInVia;

  SocialAuthResponse({
    required this.email,
    required this.photoUrl,
    required this.name,
    required this.accessToken,
    required this.signInVia,
  });
}

abstract class ISocialAuthClient {
  Future<SocialAuthResponse> login();
  Future<bool> logOut();
}
