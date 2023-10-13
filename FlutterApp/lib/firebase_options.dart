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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB8Uyqbhp_pq-Ir3B1BBVTCB4F3WFjcnPI',
    appId: '1:111623770061:web:9c00969d4df2e814163e84',
    messagingSenderId: '111623770061',
    projectId: 'trainproject1-ad5f4',
    authDomain: 'trainproject1-ad5f4.firebaseapp.com',
    databaseURL: 'https://trainproject1-ad5f4-default-rtdb.firebaseio.com',
    storageBucket: 'trainproject1-ad5f4.appspot.com',
    measurementId: 'G-BKD804PY9L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgOqjP39SFwPpgKpZxFbtw6sbQLztdWgY',
    appId: '1:111623770061:android:33a1ff38e1bdf8b6163e84',
    messagingSenderId: '111623770061',
    projectId: 'trainproject1-ad5f4',
    databaseURL: 'https://trainproject1-ad5f4-default-rtdb.firebaseio.com',
    storageBucket: 'trainproject1-ad5f4.appspot.com',
  );
}