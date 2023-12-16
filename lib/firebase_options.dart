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
        return macos;
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
    apiKey: 'AIzaSyBIL-QYHAgy2yubPi7lcZqXAY3iwMObjMU',
    appId: '1:250850755557:web:76d59047740ea99cb8650c',
    messagingSenderId: '250850755557',
    projectId: 'app-ban-hang-cf71d',
    authDomain: 'app-ban-hang-cf71d.firebaseapp.com',
    storageBucket: 'app-ban-hang-cf71d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiyvIhLtckWw4hA2TGdebgHtQQmZaNfOk',
    appId: '1:250850755557:android:5855bbf30b65a495b8650c',
    messagingSenderId: '250850755557',
    projectId: 'app-ban-hang-cf71d',
    storageBucket: 'app-ban-hang-cf71d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5_jYSJ9yEaO9HIix8M9e0E9Sg6ROw7UY',
    appId: '1:250850755557:ios:629a89448fec36e3b8650c',
    messagingSenderId: '250850755557',
    projectId: 'app-ban-hang-cf71d',
    storageBucket: 'app-ban-hang-cf71d.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5_jYSJ9yEaO9HIix8M9e0E9Sg6ROw7UY',
    appId: '1:250850755557:ios:9fa06f7dfe74d25cb8650c',
    messagingSenderId: '250850755557',
    projectId: 'app-ban-hang-cf71d',
    storageBucket: 'app-ban-hang-cf71d.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
