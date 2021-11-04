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
  final Function? toggleScreen;
  const SignIn({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obsure = true;

  IconData _visibility = Icons.visibility_off;

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
              Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: width * 0.8,
                      height: height * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Welcome Back',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headline2),
                          SizedBox(height: 30),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            color: Colors.white,
                            keyboard: TextInputType.emailAddress,
                            style: theme.textTheme.bodyText1,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: _passwordController,
                            maxLines: 1,
                            obscure: _obsure,
                            hintText: 'Password',
                            color: Colors.white,
                            style: theme.textTheme.bodyText1,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsure = !_obsure;
                                  if (!_obsure) {
                                    _visibility = Icons.visibility;
                                  } else {
                                    _visibility = Icons.visibility_off;
                                  }
                                });
                              },
                              child: Container(
                                // alignment: Alignment(1.0,50.0),
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(_visibility,
                                    size: 25, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Don't have an account? ",
                                style: theme.textTheme.bodyText2),
                            TextButton(
                                child: Text("Register",
                                    style: theme.textTheme.bodyText2!.copyWith(
                                        color: theme.primaryColorDark)),
                                onPressed: () => widget.toggleScreen!())
                          ]),
                          SizedBox(height: height * 0.1),
                          loginProvider.isLoading
                              ? CircularProgressIndicator(
                                  color: theme.primaryColorDark)
                              : Button(
                                  buttonText: "Login",
                                  color: theme.primaryColor,
                                  onTap: () async {
                                    if (_emailController.text.isEmpty ||
                                        _emailController.text.length < 4) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                            backgroundColor:
                                                theme.primaryColorDark,
                                            content: Text('Invalid email',textAlign:TextAlign.center,
                                                style: theme.textTheme.bodyText2),
                                            duration:
                                                Duration(milliseconds: 1500),
                                                 behavior:SnackBarBehavior.floating,
                                                shape: StadiumBorder()),
                                      );

                                      return null;
                                    }else
                                    if (_passwordController.text.isEmpty ||
                                        _passwordController.text.length < 4) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                theme.primaryColorDark,
                                            content: Text(
                                                'Password must be at least 4 characters',textAlign:TextAlign.center,
                                                style:
                                                    theme.textTheme.bodyText2),
                                            duration:
                                                Duration(milliseconds: 1500),
                                                behavior:SnackBarBehavior.floating,
                                                shape: StadiumBorder()
                                                ),
                                      );

                                      return null;
                                    } 
                                    else {
                                      await loginProvider.login(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim());
                                    }
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
