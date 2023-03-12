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
    apiKey: 'AIzaSyApMondLzxNQ3FVTxfyU_mo59mSiSSifho',
    appId: '1:1077656038468:web:7db249309321329d326011',
    messagingSenderId: '1077656038468',
    projectId: 'apppsss994',
    authDomain: 'apppsss994.firebaseapp.com',
    storageBucket: 'apppsss994.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6Z8QGC95IPBsIdXWNkweJnPq6IjfMxxg',
    appId: '1:1077656038468:android:e5ddfa8990aaecf5326011',
    messagingSenderId: '1077656038468',
    projectId: 'apppsss994',
    storageBucket: 'apppsss994.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-dN8c9Vfh9421vS3M4vYc43nnc9kkAEE',
    appId: '1:1077656038468:ios:8299e86c564d79d9326011',
    messagingSenderId: '1077656038468',
    projectId: 'apppsss994',
    storageBucket: 'apppsss994.appspot.com',
    iosClientId: '1077656038468-aobfff4mfbfe4k7emg8702ir1dcatd4i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFinanceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-dN8c9Vfh9421vS3M4vYc43nnc9kkAEE',
    appId: '1:1077656038468:ios:8299e86c564d79d9326011',
    messagingSenderId: '1077656038468',
    projectId: 'apppsss994',
    storageBucket: 'apppsss994.appspot.com',
    iosClientId: '1077656038468-aobfff4mfbfe4k7emg8702ir1dcatd4i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFinanceApp',
  );
}