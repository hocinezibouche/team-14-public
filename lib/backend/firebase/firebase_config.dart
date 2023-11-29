import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDXgpS7cIwnfORkdj7vxt_iHr-3SXe-FPg",
            authDomain: "test2-8226a.firebaseapp.com",
            projectId: "test2-8226a",
            storageBucket: "test2-8226a.appspot.com",
            messagingSenderId: "223914281301",
            appId: "1:223914281301:web:3d030bae8e1150077707dc",
            measurementId: "G-LZ93D9JTPP"));
  } else {
    await Firebase.initializeApp();
  }
}
