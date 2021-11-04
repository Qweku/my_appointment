// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_appointment/auth/authenticate.dart';
import 'package:my_appointment/themes.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'services/authservices.dart';
import 'wrapper.dart';

Future<void> main() async {
  await ThemeManager.initialise();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          return snapshot.hasData ? MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: AuthService()),
              StreamProvider<User?>.value(
                value: AuthService().user,
                initialData: null,
              )
            ],
            child: ThemeBuilder(
              themes: getThemes(),
              defaultThemeMode: ThemeMode.system,
              builder: (context, regularTheme, darkTheme, themeMode) =>
                  MaterialApp(
                title: 'My Appointment',
                home: Wrapper(),
                theme: regularTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ): Loading();
        });
  }
}

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:CircularProgressIndicator()
      )
      
    );
  }
}
