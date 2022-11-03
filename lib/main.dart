import 'package:efl/Screens/mainMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;
  late Widget firstPage;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      firstPage = MainMenu();
    } else {
      firstPage = LoginScreen();
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'EFL', home: firstPage);
  }
}
