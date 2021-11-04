// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_appointment/components/button.dart';
import 'package:my_appointment/components/textFields.dart';
import 'package:my_appointment/homeScreen.dart';
import 'package:my_appointment/services/authservices.dart';
import 'package:provider/provider.dart';

import 'authenticate.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => _onBackPressed(context),
      child: Scaffold(
          backgroundColor: theme.primaryColor,
          body: Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.6),
                child: Text('LOGIN',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline2!.copyWith(fontSize: 50)),
              ),
              Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: width * 0.8,
                      height: height * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Username',
                            color: Colors.white,
                            keyboard: TextInputType.emailAddress,
                            style: theme.textTheme.bodyText1,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: _passwordController,
                            maxLines: 1,
                            obscure: true,
                            hintText: 'Password',
                            color: Colors.white,
                            style: theme.textTheme.bodyText1,
                          ),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Don't have an account? ",
                                style: theme.textTheme.bodyText2),
                            TextButton(
                                child: Text("Register",
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: theme.primaryColorDark)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                })
                          ]),
                          SizedBox(height: height * 0.1),
                          loginProvider.isLoading
                              ? CircularProgressIndicator(
                                  color: theme.primaryColorDark)
                              : Button(
                                  buttonText: "Login",
                                  color: theme.primaryColor,
                                  onTap: () async {
                                    await loginProvider.login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());

                                    // dynamic result = await _auth.signInAnon();
                                    // if (result == null) {
                                    //   print('Error, signing in');
                                    // } else {
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) => HomeScreen()));
                                    //   print(result);
                                    // }
                                  },
                                )
                        ],
                      ))),
            ],
          )),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return (await showDialog<bool>(
            context: context,
            builder: (c) => AlertDialog(
                  title: Text("Warning"),
                  content: Text("Do you really want to exit?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text("Yes")),
                    TextButton(
                        onPressed: () => Navigator.pop(c, false),
                        child: Text("No"))
                  ],
                ))) ??
        false;
  }
}
