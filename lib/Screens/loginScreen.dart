import 'package:efl/Screens/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../Services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final pripmaryColor = const Color(0xFF252c4a);
  final secondaryColor = const Color(0xFF117eeb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
          Text('Login\nPage',
          style: TextStyle(fontSize: 32, color: Colors.grey,fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 150),
          Center(
            child: RawMaterialButton(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Login via Google',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              shape: const StadiumBorder(),
              fillColor: secondaryColor,
              onPressed: () async {
                await signWithGoogle();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const MainMenu()));
              },
            ),
          ),
              ],
            ),
        ));
  }
}
