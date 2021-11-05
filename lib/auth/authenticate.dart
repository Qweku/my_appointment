// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_appointment/auth/sign-in.dart';
import 'package:my_appointment/components/button.dart';
import 'package:my_appointment/components/textFields.dart';
import 'package:my_appointment/services/authservices.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return Register(toggleScreen: toggleScreen);
    } else {
      return SignIn(toggleScreen: toggleScreen);
    }
  }
}

class Register extends StatefulWidget {
  final Function? toggleScreen;
  const Register({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    return Scaffold(
      resizeToAvoidBottomInset:false,
        backgroundColor: theme.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            
          children: [
             SizedBox(
                height: height*0.2,
                width:width*0.8,
                child:Column(children: [
                  Icon(Icons.menu_book,color:theme.primaryColorDark,size:40),
                  SizedBox(height:height*0.02),
                  Text('My Appointment',style:theme.textTheme.headline4),
                   Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.edit, color: theme.primaryColorDark),
                  ),
                  Expanded(
                    child: Divider(color: Colors.white),
                  )
                ]),
              ),
             
                ],)
              ),
             
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
                        Text('Create An Account',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headline2),
                        SizedBox(height: 30),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Enter email',
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
                              child:
                                  Icon(_visibility, size: 25, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          Text("Already have an account? ",
                              style: theme.textTheme.bodyText2),
                          TextButton(
                              child: Text("Login",
                                  style: theme.textTheme.bodyText2!
                                      .copyWith(color: theme.primaryColorDark)),
                              onPressed: () => widget.toggleScreen!())
                        ]),
                        SizedBox(height: height * 0.1),
                        loginProvider.isLoading
                            ? CircularProgressIndicator(
                                color: theme.primaryColorDark)
                            : Button(
                                buttonText: "Register",
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
                                                    'Password must be at least 4 characters',
                                                    textAlign:TextAlign.center,
                                                    style:
                                                        theme.textTheme.bodyText2),
                                                duration:
                                                    Duration(milliseconds: 1500),
                                                     behavior:SnackBarBehavior.floating,
                                                    shape: StadiumBorder()),
                                          );
            
                                          return null;
                                        }  else {
                                    await loginProvider.register(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                  }
                                },
                              )
                      ],
                    ))),
          ],
        ));
  }
}
