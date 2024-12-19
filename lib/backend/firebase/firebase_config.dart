import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDFp96VcVzE6-vKUabjbu7XI3YddD6L2O4",
            authDomain: "sensiblebizpro.firebaseapp.com",
            projectId: "sensiblebizpro",
            storageBucket: "sensiblebizpro.appspot.com",
            messagingSenderId: "401022448274",
            appId: "1:401022448274:web:dfbafb032f107409762c4b",
            measurementId: "G-RSNL2E5GQK"));
  } else {
    await Firebase.initializeApp();
  }
}
