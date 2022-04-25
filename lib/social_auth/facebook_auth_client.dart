
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_login_strategy/social_auth/social_auth_client.dart';
import 'package:social_login_strategy/social_auth/social_auth_factory.dart';

class FacebookAuthClient implements ISocialAuthClient {
  late final FacebookAuth _instance;

  FacebookAuthClient(this._instance);

  @override
  Future<bool> logOut() async {
      _instance.logOut();
      return true;
  }

  @override
  Future<SocialAuthResponse> login() async {
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);
    if (result.status == LoginStatus.success) {
      final response = await FacebookAuth.instance.getUserData();
      print(response);
      final responseModel = SocialAuthResponse(
        email: response['email'],
        photoUrl: response['picture']['data']['url'],
        name: response['name'],
        accessToken: result.accessToken!.token,
        signInVia: AuthClient.facebook.name.toString(),
      );
      return responseModel;
    } else {

      return SocialAuthResponse(
          email: '', photoUrl: '', name: '', accessToken: '', signInVia: '');
    }
  }
}
