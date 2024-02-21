// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyCytwLALV20YrCidzkUwAQrtSztFfCsiec',
//     appId: '1:58522179189:web:535ed57b70d8043f108a3c',
//     messagingSenderId: '58522179189',
//     projectId: 'my-chat-eb6df',
//     authDomain: 'my-chat-eb6df.firebaseapp.com',
//     storageBucket: 'my-chat-eb6df.appspot.com',
//     measurementId: 'G-C1JYFW3VBV',
//   );
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyBAkh2UxGLgUkDTXD_gkfjxUi7LDqOmp1M',
//     appId: '1:58522179189:android:3a9f7e84b1987c68108a3c',
//     messagingSenderId: '58522179189',
//     projectId: 'my-chat-eb6df',
//     storageBucket: 'my-chat-eb6df.appspot.com',
//   );
//
//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyBZXflDfosJMU898yFle1XnjyvCSPxS3Os',
//     appId: '1:58522179189:ios:9a0c853b1b513939108a3c',
//     messagingSenderId: '58522179189',
//     projectId: 'my-chat-eb6df',
//     storageBucket: 'my-chat-eb6df.appspot.com',
//     iosClientId: '58522179189-srtsnoahg41c30pb93ineh6rnd9rv2gb.apps.googleusercontent.com',
//     iosBundleId: 'com.example.chet',
//   );
//
//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyBZXflDfosJMU898yFle1XnjyvCSPxS3Os',
//     appId: '1:58522179189:ios:9a0c853b1b513939108a3c',
//     messagingSenderId: '58522179189',
//     projectId: 'my-chat-eb6df',
//     storageBucket: 'my-chat-eb6df.appspot.com',
//     iosClientId: '58522179189-srtsnoahg41c30pb93ineh6rnd9rv2gb.apps.googleusercontent.com',
//     iosBundleId: 'com.example.chet',
//   );
// }