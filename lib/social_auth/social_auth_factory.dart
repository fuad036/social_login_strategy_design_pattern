
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login_strategy/social_auth/apple_auth_client.dart';
import 'package:social_login_strategy/social_auth/facebook_auth_client.dart';
import 'package:social_login_strategy/social_auth/google_auth_client.dart';
import 'package:social_login_strategy/social_auth/social_auth.dart';

enum AuthClient { facebook, google, apple }

class SocialAuthFactory {

  static SocialAuth createSocialAuthFor(AuthClient authClient) {
    switch (authClient) {
      case AuthClient.facebook:
        return SocialAuth(FacebookAuthClient(FacebookAuth.instance));
      case AuthClient.apple:
        return SocialAuth(AppleAuthClient());
      case AuthClient.google:
        return SocialAuth(GoogleAuthClient(GoogleSignIn()));
      default:
        return SocialAuth(GoogleAuthClient(GoogleSignIn()));
    }
  }
}
