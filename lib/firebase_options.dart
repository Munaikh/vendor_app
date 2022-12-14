// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBb-uPxMv49X_80BxfqVjsGlc_G52NQYlM',
    appId: '1:1015284912058:web:cb41b848874938f4cc1783',
    messagingSenderId: '1015284912058',
    projectId: 'test-template-27ab9',
    authDomain: 'test-template-27ab9.firebaseapp.com',
    storageBucket: 'test-template-27ab9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQZbkWz7VC6z5cic9b07Oust72MVNxMlc',
    appId: '1:1015284912058:android:104d5aa9320f2618cc1783',
    messagingSenderId: '1015284912058',
    projectId: 'test-template-27ab9',
    storageBucket: 'test-template-27ab9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeEwLjrtkkqoGjow8URmU5R9jfJnQBbro',
    appId: '1:1015284912058:ios:5a95a44fc662fbcacc1783',
    messagingSenderId: '1015284912058',
    projectId: 'test-template-27ab9',
    storageBucket: 'test-template-27ab9.appspot.com',
    iosClientId: '1015284912058-arlbqg3jc0clu9sbvsq3qjd91iidhp5l.apps.googleusercontent.com',
    iosBundleId: 'com.example.vendorApp',
  );
}
