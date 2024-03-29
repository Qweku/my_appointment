// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDdHaekIDyQcYZJHbSyjKhlERgbtJUxis4',
    appId: '1:551024259035:web:5003beeb8ba72614a681fe',
    messagingSenderId: '551024259035',
    projectId: 'my-appointment-c2167',
    authDomain: 'my-appointment-c2167.firebaseapp.com',
    storageBucket: 'my-appointment-c2167.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD45uyf4g4oLdx5wgosvugGPhxSKMOFaYw',
    appId: '1:551024259035:android:38c8c0312b0b7f56a681fe',
    messagingSenderId: '551024259035',
    projectId: 'my-appointment-c2167',
    storageBucket: 'my-appointment-c2167.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPhgIXEsO6G7jTX0AvX9jesNgGdfpseV4',
    appId: '1:551024259035:ios:04d84bd5fe3115f9a681fe',
    messagingSenderId: '551024259035',
    projectId: 'my-appointment-c2167',
    storageBucket: 'my-appointment-c2167.appspot.com',
    iosClientId: '551024259035-ock1d3g6teruk85cqfkc8sf9duinv6lm.apps.googleusercontent.com',
    iosBundleId: 'com.example.myAppointment',
  );
}
