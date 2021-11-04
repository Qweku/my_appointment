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
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    return Scaffold(
        backgroundColor: theme.primaryColor,
        body: Stack(
          children: [
            Container(
              alignment:Alignment(0,-0.6),
              child: Text('REGISTER',textAlign:TextAlign.center,
              style:theme.textTheme.headline2!.copyWith(fontSize:50)),
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
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          Text("Already have an account? ",
                              style: theme.textTheme.bodyText2),
                          TextButton(
                              child: Text("Login",
                                  style: theme.textTheme.bodyText2!
                                      .copyWith(color: theme.primaryColorDark)),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]),
                        SizedBox(height: height * 0.1),
                        loginProvider.isLoading
                            ? CircularProgressIndicator(
                                color: theme.primaryColorDark)
                            : Button(
                                buttonText: "Register",
                                color: theme.primaryColor,
                                onTap: () async {
                                  await loginProvider.register(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim());

                                  // dynamic result = await _auth.RegisterAnon();
                                  // if (result == null) {
                                  //   print('Error, Registerg in');
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
        ));
  }
}
