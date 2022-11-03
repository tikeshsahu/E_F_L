import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainMenu.dart';

class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final pripmaryColor = Color(0xFF252c4a);
  final secondaryColor = Color(0xFF117eeb);

  setPrev() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('scores', <String>['5']);
    await prefs.setStringList('scores', <String>[widget.score.toString()]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPrev();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pripmaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Congratulations",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Text(
            "You Score is",
            style: TextStyle(color: Colors.white, fontSize: 34.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "${widget.score}",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainMenu(),
                  ));
            },
            // shape: StadiumBorder(),
            // color: AppColor.secondaryColor,
            // padding: EdgeInsets.all(18.0),
            child: Text(
              "Repeat the quizz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
