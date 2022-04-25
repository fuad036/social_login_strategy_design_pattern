import 'package:social_login_strategy/social_auth/social_auth_client.dart';

class SocialAuth {
  final ISocialAuthClient _client;
  SocialAuth(this._client);

  Future<SocialAuthResponse> login() async{
    return _client.login();
  }

  Future<bool>logOut() async {
    return _client.logOut();
  }
}

