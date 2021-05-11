import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:flutter_checkauthentication/widgets/widgets.dart';
import 'package:flutter_checkauthentication/authentication/signup.dart';
import 'package:flutter_checkauthentication/authentication/password_reset.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String message = '';
  bool isLoading = false;
  bool signInError = false;

  login() {
    
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .2,
                      ),
                      Text('LOGIN', style: TextStyle(fontSize: 24.0)),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      if (signInError)
                        Text(message, style: TextStyle(color: Colors.red)),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      TextFieldWidget(
                        readOnly: false,
                        textInputType: TextInputType.text,
                        maxLines: 1,
                        obscureText: false,
                        initialValue: email,
                        onChanged: (val) => setState(() => email = val),
                        validator: (val) => !isEmail(val) ? 'Invalid Email' : null,
                        labelText: 'Email Address',
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      TextFieldWidget(
                        readOnly: false,
                        textInputType: TextInputType.text,
                        maxLines: 1,
                        obscureText: true,
                        initialValue: email,
                        onChanged: (val) => setState(() => password = val),
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        labelText: 'Password',
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordReset())),
                              child: Text('Forgot Password? Click Here'),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login();
                                }
                              }, //=> login()},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                child: Text('Login'),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * .03),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.black),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Container(
                            child: TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp())),
                              child: Text('Register a New User'),
                            ),
                          ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading) LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}