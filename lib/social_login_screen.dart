import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_login_strategy/social_auth/social_auth.dart';
import 'package:social_login_strategy/social_auth/social_auth_client.dart';
import 'package:social_login_strategy/social_auth/social_auth_factory.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  Future<void> socialAuthSignIn(
      AuthClient authClient, BuildContext context) async {
    SocialAuth socialAuth = SocialAuthFactory.createSocialAuthFor(authClient);
    try {
      SocialAuthResponse response = await socialAuth.login();
      if (response.accessToken!.isEmpty) throw Exception();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('the error is: ${e.toString()}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginButton(
                onPressed: () {
                  socialAuthSignIn(AuthClient.facebook, context);
                },
                label: 'Log In with Facebook',
              ),
              const SizedBox(
                height: 16,
              ),
              LoginButton(
                label: 'Log In with Google',
                onPressed: () {
                  socialAuthSignIn(AuthClient.google, context);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              LoginButton(
                onPressed: () {
                  // TODO: practice this by implementing apple client
                  socialAuthSignIn(AuthClient.apple, context);
                },
                label: 'Log In with Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const LoginButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            onPressed();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          )),
    );
  }
}
