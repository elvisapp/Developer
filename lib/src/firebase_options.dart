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
    apiKey: 'AIzaSyA_F55_nmix2FrCE3Zn_hTRC71s-GJyMM0',
    appId: '1:42100852079:web:855c971e0fa920510b549a',
    messagingSenderId: '42100852079',
    projectId: 'web-elvis-com',
    authDomain: 'web-elvis-com.firebaseapp.com',
    storageBucket: 'web-elvis-com.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkusp3e875nlioiYlDzWG17-sV7N4DSeo',
    appId: '1:42100852079:android:a91f69c09cfeeebf0b549a',
    messagingSenderId: '42100852079',
    projectId: 'web-elvis-com',
    storageBucket: 'web-elvis-com.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuI9knefXEWysr5TRmMoK59YL_vT_jniw',
    appId: '1:42100852079:ios:18eb8ccf36b358d20b549a',
    messagingSenderId: '42100852079',
    projectId: 'web-elvis-com',
    storageBucket: 'web-elvis-com.appspot.com',
    iosClientId: '42100852079-l6vrldfhabors96j8b2g65u4fe46gdmv.apps.googleusercontent.com',
    iosBundleId: 'com.elvis.web',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuI9knefXEWysr5TRmMoK59YL_vT_jniw',
    appId: '1:42100852079:ios:18eb8ccf36b358d20b549a',
    messagingSenderId: '42100852079',
    projectId: 'web-elvis-com',
    storageBucket: 'web-elvis-com.appspot.com',
    iosClientId: '42100852079-l6vrldfhabors96j8b2g65u4fe46gdmv.apps.googleusercontent.com',
    iosBundleId: 'com.elvis.web',
  );
}