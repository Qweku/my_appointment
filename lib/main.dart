// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_appointment/firebase_options.dart';
//import 'package:my_appointment/auth/authenticate.dart';
import 'package:provider/provider.dart';
// import 'package:stacked_themes/stacked_themes.dart';

import 'services/authservices.dart';
import 'wrapper.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
   Provider<AuthService>(
      create: (_) => AuthService(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Appointment',
      home: Wrapper(),
      theme: ThemeData(
          primaryColor: Colors.blue,
          primaryColorLight: Color(0xFFFFFFFF),
          primaryColorDark: Colors.red,
          cardColor: Color(0xFF212121),
          textTheme: TextTheme(
              displayLarge: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 30,
                  fontFamily: 'Quicksand'),
              displayMedium: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Quicksand'),
              displaySmall: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 20,
                  fontFamily: 'Quicksand'),
              headlineMedium: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Quicksand'),
              bodyLarge: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 15,
                  fontFamily: 'Quicksand'),
              bodyMedium: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'Quicksand'),
              labelLarge: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Quicksand')),
          iconTheme: IconThemeData(color: Color(0xFF212121))),
      debugShowCheckedModeBanner: false,
    );

   }
}
