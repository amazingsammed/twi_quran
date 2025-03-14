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
    apiKey: 'AIzaSyAiN8MANmluhbJG5QaCtRDx5c145b__dl8',
    appId: '1:112592587889:web:b9f24fa3e659655df9dfd0',
    messagingSenderId: '112592587889',
    projectId: 'my-shahaada',
    authDomain: 'my-shahaada.firebaseapp.com',
    storageBucket: 'my-shahaada.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8FoWTBygcwM4l1ru3yRlGCy0RR97DqwA',
    appId: '1:112592587889:android:162b06d286557ed7f9dfd0',
    messagingSenderId: '112592587889',
    projectId: 'my-shahaada',
    storageBucket: 'my-shahaada.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA03jTZYAuuS3FLAWnWvvrBsIu_W-1pFa4',
    appId: '1:112592587889:ios:71c6c170aaa948c9f9dfd0',
    messagingSenderId: '112592587889',
    projectId: 'my-shahaada',
    storageBucket: 'my-shahaada.firebasestorage.app',
    iosBundleId: 'com.trustmedia.twiQuran',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA03jTZYAuuS3FLAWnWvvrBsIu_W-1pFa4',
    appId: '1:112592587889:ios:005dcab4827592fdf9dfd0',
    messagingSenderId: '112592587889',
    projectId: 'my-shahaada',
    storageBucket: 'my-shahaada.firebasestorage.app',
    iosBundleId: 'com.example.twiQuran',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiN8MANmluhbJG5QaCtRDx5c145b__dl8',
    appId: '1:112592587889:web:85c44f7d3c582dc4f9dfd0',
    messagingSenderId: '112592587889',
    projectId: 'my-shahaada',
    authDomain: 'my-shahaada.firebaseapp.com',
    storageBucket: 'my-shahaada.firebasestorage.app',
  );
}
