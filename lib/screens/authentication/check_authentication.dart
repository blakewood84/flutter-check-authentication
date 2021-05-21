
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_checkauthentication/screens/home/home_screen.dart';
import 'package:flutter_checkauthentication/widgets/splash_screen.dart';

class CheckAuthentication extends StatefulWidget {
  @override
  _CheckAuthenticationState createState() => _CheckAuthenticationState();
}

class _CheckAuthenticationState extends State<CheckAuthentication> {

  bool _isLoading = true;
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () async => checkAuth()
    );
  }

  void checkAuth() async {
    CognitoAuthSession result = await Amplify.Auth.fetchAuthSession();
    if(result.isSignedIn) setState(() {
      _isLoading = false; _isSignedIn = true;
    });
    else setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading && !_isSignedIn) {
      return SplashScreen();
    }
    if(!_isLoading && _isSignedIn) return HomeScreen();
    return SplashScreen();
  }
}