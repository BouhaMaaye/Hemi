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
    apiKey: 'AIzaSyDABWG7haAqkZdXB-HDB6n3u2cXbjkdvMM',
    appId: '1:294059748530:web:7c805f6e03c0698c16adab',
    messagingSenderId: '294059748530',
    projectId: 'hemi-b6b82',
    authDomain: 'hemi-b6b82.firebaseapp.com',
    storageBucket: 'hemi-b6b82.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0lLrW2vb63HTIO7dGPCmQ2x3p0rKgZyI',
    appId: '1:294059748530:android:ab2fb88e9e768f5416adab',
    messagingSenderId: '294059748530',
    projectId: 'hemi-b6b82',
    storageBucket: 'hemi-b6b82.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArUlnDLiSYemnw0Z90XVzihX_aBh-Ea-o',
    appId: '1:294059748530:ios:3ee9e6de8501cf5916adab',
    messagingSenderId: '294059748530',
    projectId: 'hemi-b6b82',
    storageBucket: 'hemi-b6b82.appspot.com',
    iosClientId: '294059748530-lf5snqh2051h9ugj01opmcsst1kk6eev.apps.googleusercontent.com',
    iosBundleId: 'com.example.hemi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArUlnDLiSYemnw0Z90XVzihX_aBh-Ea-o',
    appId: '1:294059748530:ios:3ee9e6de8501cf5916adab',
    messagingSenderId: '294059748530',
    projectId: 'hemi-b6b82',
    storageBucket: 'hemi-b6b82.appspot.com',
    iosClientId: '294059748530-lf5snqh2051h9ugj01opmcsst1kk6eev.apps.googleusercontent.com',
    iosBundleId: 'com.example.hemi',
  );
}
