import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBRdRGeQAUb_Vf9Rc1JVfEiQjoM-M-4gXU",
            authDomain: "innolympics-c68ba.firebaseapp.com",
            projectId: "innolympics-c68ba",
            storageBucket: "innolympics-c68ba.firebasestorage.app",
            messagingSenderId: "850771391386",
            appId: "1:850771391386:web:d68fa71c720243d5294023"));
  } else {
    await Firebase.initializeApp();
  }
}
