import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///

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
    apiKey: 'AIzaSyBZgIJ6YxzQMVIPivsStiguZ6X-zU8rw1w',
    appId: '1:950186778908:web:7b8d5d24871cb726069ad9',
    messagingSenderId: '950186778908',
    projectId: 'coleta-portel',
    authDomain: 'coleta-portel.firebaseapp.com',
    storageBucket: 'coleta-portel.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnC8U-5udYIoo0ZSRhEAtl1NrDajxIfQY',
    appId: '1:950186778908:android:dfb6be8b549e7a4e069ad9',
    messagingSenderId: '950186778908',
    projectId: 'coleta-portel',
    storageBucket: 'coleta-portel.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAH2uspf7ATLWCF4Ni9HS79gPiPAZCftOM',
    appId: '1:950186778908:ios:cc3a8e3eb6ea8728069ad9',
    messagingSenderId: '950186778908',
    projectId: 'coleta-portel',
    storageBucket: 'coleta-portel.firebasestorage.app',
    iosBundleId: 'com.example.coletaPortel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAH2uspf7ATLWCF4Ni9HS79gPiPAZCftOM',
    appId: '1:950186778908:ios:cc3a8e3eb6ea8728069ad9',
    messagingSenderId: '950186778908',
    projectId: 'coleta-portel',
    storageBucket: 'coleta-portel.firebasestorage.app',
    iosBundleId: 'com.example.coletaPortel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBZgIJ6YxzQMVIPivsStiguZ6X-zU8rw1w',
    appId: '1:950186778908:web:cb848e4a8bcb0e93069ad9',
    messagingSenderId: '950186778908',
    projectId: 'coleta-portel',
    authDomain: 'coleta-portel.firebaseapp.com',
    storageBucket: 'coleta-portel.firebasestorage.app',
  );

}