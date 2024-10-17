// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDXXYeA58-tp9W-EGq8RPlApwm6WBBiNPY',
    appId: '1:218817205950:web:c998ff1590e8847cd830ef',
    messagingSenderId: '218817205950',
    projectId: 'testing-cli-149f3',
    authDomain: 'testing-cli-149f3.firebaseapp.com',
    storageBucket: 'testing-cli-149f3.appspot.com',
    measurementId: 'G-2B8LG0TYQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSM9T1TFkdObeL5vhEh1H5UmtdwzEjGt0',
    appId: '1:218817205950:android:c2a7e4d3b7b95b71d830ef',
    messagingSenderId: '218817205950',
    projectId: 'testing-cli-149f3',
    storageBucket: 'testing-cli-149f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7uF9GIx5SQCxbb-QQuzi-YLDJpaDCZ1w',
    appId: '1:218817205950:ios:811a2085d0a58be7d830ef',
    messagingSenderId: '218817205950',
    projectId: 'testing-cli-149f3',
    storageBucket: 'testing-cli-149f3.appspot.com',
    iosBundleId: 'com.example.firebasedemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD7uF9GIx5SQCxbb-QQuzi-YLDJpaDCZ1w',
    appId: '1:218817205950:ios:811a2085d0a58be7d830ef',
    messagingSenderId: '218817205950',
    projectId: 'testing-cli-149f3',
    storageBucket: 'testing-cli-149f3.appspot.com',
    iosBundleId: 'com.example.firebasedemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXXYeA58-tp9W-EGq8RPlApwm6WBBiNPY',
    appId: '1:218817205950:web:527515ec4f7dc611d830ef',
    messagingSenderId: '218817205950',
    projectId: 'testing-cli-149f3',
    authDomain: 'testing-cli-149f3.firebaseapp.com',
    storageBucket: 'testing-cli-149f3.appspot.com',
    measurementId: 'G-312W1L9QFQ',
  );
}
