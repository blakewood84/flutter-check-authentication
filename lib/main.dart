import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_checkauthentication/amplifyconfiguration.dart';
import 'package:flutter_checkauthentication/authentication/check_authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    Amplify.addPlugin(AmplifyAuthCognito());
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print("Amplify was already configured. Was the app restarted?");
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AWS Check Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckAuthentication()
    );
  }
}


