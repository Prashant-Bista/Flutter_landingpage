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
    apiKey: 'AIzaSyAaJQ2wSjrspjESujYtNEGZuvGDW0nQ_8k',
    appId: '1:202425399869:web:fa409dd4b2fd3df0a40854',
    messagingSenderId: '202425399869',
    projectId: 'prashant-bista',
    authDomain: 'prashant-bista.firebaseapp.com',
    storageBucket: 'prashant-bista.appspot.com',
    measurementId: 'G-0Y2KT6C2KX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZfP2xHrdGAf6vZ_mJDao9L50eSsahXd0',
    appId: '1:202425399869:android:104fa5bd88a8a396a40854',
    messagingSenderId: '202425399869',
    projectId: 'prashant-bista',
    storageBucket: 'prashant-bista.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBalAirvhGPCdIc41gpEakdjGy7yRiF_vk',
    appId: '1:202425399869:ios:ef76b2089c0d6a9da40854',
    messagingSenderId: '202425399869',
    projectId: 'prashant-bista',
    storageBucket: 'prashant-bista.appspot.com',
    iosBundleId: 'com.example.prashantBista',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBalAirvhGPCdIc41gpEakdjGy7yRiF_vk',
    appId: '1:202425399869:ios:5f936e069d84b000a40854',
    messagingSenderId: '202425399869',
    projectId: 'prashant-bista',
    storageBucket: 'prashant-bista.appspot.com',
    iosBundleId: 'com.portfolio.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAaJQ2wSjrspjESujYtNEGZuvGDW0nQ_8k',
    appId: '1:202425399869:web:f263fef0f26efaf6a40854',
    messagingSenderId: '202425399869',
    projectId: 'prashant-bista',
    authDomain: 'prashant-bista.firebaseapp.com',
    storageBucket: 'prashant-bista.appspot.com',
    measurementId: 'G-R4L52KVEP7',
  );
}