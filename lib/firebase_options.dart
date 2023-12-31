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
    apiKey: 'AIzaSyBWKI7o_hWqUUlKkm51UsuGI7fLMgw66gU',
    appId: '1:777674040355:web:fa1edd799aed1579e1fd96',
    messagingSenderId: '777674040355',
    projectId: 'app-chat-25bb4',
    authDomain: 'app-chat-25bb4.firebaseapp.com',
    storageBucket: 'app-chat-25bb4.appspot.com',
    measurementId: 'G-1ZWX1M93E5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBensbfNbiSrzOeASPQJOckiboqaKsHcTU',
    appId: '1:777674040355:android:73910e8a3b973234e1fd96',
    messagingSenderId: '777674040355',
    projectId: 'app-chat-25bb4',
    storageBucket: 'app-chat-25bb4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpJczeNSdMbJ6XZQsz9oS9GJtg3kHdMq0',
    appId: '1:777674040355:ios:4af46e2f5315f2f0e1fd96',
    messagingSenderId: '777674040355',
    projectId: 'app-chat-25bb4',
    storageBucket: 'app-chat-25bb4.appspot.com',
    iosClientId: '777674040355-fn5hb71skr48ddqo8dm5io2m8ksftr6k.apps.googleusercontent.com',
    iosBundleId: 'com.example.appChatFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpJczeNSdMbJ6XZQsz9oS9GJtg3kHdMq0',
    appId: '1:777674040355:ios:c3093ae3e3a7c24ae1fd96',
    messagingSenderId: '777674040355',
    projectId: 'app-chat-25bb4',
    storageBucket: 'app-chat-25bb4.appspot.com',
    iosClientId: '777674040355-r53kq681vipaai8cc4n04q8ieet8qf2k.apps.googleusercontent.com',
    iosBundleId: 'com.example.appChatFirebase.RunnerTests',
  );
}
