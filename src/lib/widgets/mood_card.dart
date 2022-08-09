import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  final urlImage;
  const MoodCard({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      height: 84,
      width: 59,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(urlImage))),
    );
  }
}
