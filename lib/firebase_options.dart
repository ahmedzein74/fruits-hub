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
    apiKey: 'AIzaSyCiMo6ryC49MgLfe6DqLKPs8cNAXmxMqW8',
    appId: '1:565082239551:web:045d4c9d33530825433e8a',
    messagingSenderId: '565082239551',
    projectId: 'fruits-2ad73',
    authDomain: 'fruits-2ad73.firebaseapp.com',
    storageBucket: 'fruits-2ad73.firebasestorage.app',
    measurementId: 'G-ZHGYG0TSCD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWOKNQ4QZGI6h58I9fo_syRUB7larAXdM',
    appId: '1:565082239551:android:14cf661d4aaf65a3433e8a',
    messagingSenderId: '565082239551',
    projectId: 'fruits-2ad73',
    storageBucket: 'fruits-2ad73.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8obZHARvobahjNj18TLJLj9yHt3Fyr7Y',
    appId: '1:565082239551:ios:788526adba76c2cd433e8a',
    messagingSenderId: '565082239551',
    projectId: 'fruits-2ad73',
    storageBucket: 'fruits-2ad73.firebasestorage.app',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8obZHARvobahjNj18TLJLj9yHt3Fyr7Y',
    appId: '1:565082239551:ios:788526adba76c2cd433e8a',
    messagingSenderId: '565082239551',
    projectId: 'fruits-2ad73',
    storageBucket: 'fruits-2ad73.firebasestorage.app',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCiMo6ryC49MgLfe6DqLKPs8cNAXmxMqW8',
    appId: '1:565082239551:web:9ca08944ed1cb743433e8a',
    messagingSenderId: '565082239551',
    projectId: 'fruits-2ad73',
    authDomain: 'fruits-2ad73.firebaseapp.com',
    storageBucket: 'fruits-2ad73.firebasestorage.app',
    measurementId: 'G-H18WVWHYW3',
  );
}
