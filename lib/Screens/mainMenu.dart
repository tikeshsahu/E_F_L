import 'package:efl/Screens/loginScreen.dart';
import 'package:efl/Screens/quizScreen.dart';
import 'package:efl/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final pripmaryColor = Color(0xFF252c4a);
  final secondaryColor = Color(0xFF117eeb);
  List<String>? previousScores = [];

  getPrev() async {
    final prefs = await SharedPreferences.getInstance();
    previousScores = prefs.getStringList('scores');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrev();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirm LogOut?"),
          actions: <Widget>[
            ElevatedButton(
              child: new Text("Yes"),
              onPressed: () async{
                await signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
              },
            ),
            ElevatedButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pripmaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        backgroundColor: Colors.red,
        onPressed: () {
          _showDialog();
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Column(
              children: [
                Text(
                  "Quiz App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 130),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizzScreen(),
                        ));
                  },
                  shape: const StadiumBorder(),
                  fillColor: secondaryColor,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      "Start the Quizz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
