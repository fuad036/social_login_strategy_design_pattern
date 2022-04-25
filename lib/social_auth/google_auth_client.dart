

import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login_strategy/social_auth/social_auth_client.dart';
import 'package:social_login_strategy/social_auth/social_auth_factory.dart';

class GoogleAuthClient implements ISocialAuthClient {
  late final GoogleSignIn _instance;

  GoogleAuthClient(this._instance);

  @override
  Future<bool> logOut() async {
      _instance.signOut();
      return true;
  }

  @override
  Future<SocialAuthResponse> login() async {
    final value = await _instance.signIn();
    final authentication = await value!.authentication;
    final responseModel = SocialAuthResponse(
      email: value.email,
      photoUrl: value.photoUrl,
      name: value.displayName,
      accessToken: authentication.idToken,
      signInVia: AuthClient.google.name.toString(),
    );
    return responseModel;
  }
}
