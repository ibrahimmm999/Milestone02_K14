import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Courses",
          style: TextStyle(color: Color.fromRGBO(206, 125, 107, 1.0)),
        ),
        backgroundColor: Color.fromRGBO(245, 211, 180, 1.0),
      ),
      body: ListView(
        children: [
          Container(
              height: 310,
              width: 300,
              padding: EdgeInsets.only(top: 40),
              color: Colors.white,
              child: Image(
                image: AssetImage("assets/mindful.png"),
                fit: BoxFit.fill,
              )),
          Container(
              height: 270,
              width: 300,
              color: Colors.white,
              child: Image(
                image: AssetImage("assets/meditating.png"),
                fit: BoxFit.fill,
              )),
          Container(
              height: 270,
              width: 300,
              color: Colors.white,
              child: Image(
                image: AssetImage("assets/selflove.png"),
                fit: BoxFit.fill,
              )),
          Container(
              height: 270,
              width: 300,
              color: Colors.white,
              child: Image(
                image: AssetImage("assets/moodtrack.png"),
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
