import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_header.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Notifications',
      );
    }

    Widget backIcon() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 35),
            height: 24.5,
            width: 31,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/back_icon.png'))),
          ),
        ),
      );
    }

    Widget content1() {
      return Container(
        height: 155,
        width: double.infinity,
        margin: EdgeInsets.only(right: 25, left: 25, top: 18),
        padding: EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
            color: Color(0xffFEF3E7), borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You haven’t checked in today',
              style: darkBrownTextStyle.copyWith(
                  fontSize: 18.5, fontWeight: extraBold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Fill in how you’re feeling today and\nwrite your journal',
              style: blackTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Go',
                    style: orangeTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        color: kOrangeColor,
                        size: 18,
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget content2() {
      return Container(
        height: 155,
        width: double.infinity,
        margin: EdgeInsets.only(right: 25, left: 25, top: 18),
        padding: EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
            color: Color(0xffFEF3E7), borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You seem to be down lately',
              style: darkBrownTextStyle.copyWith(
                  fontSize: 18.5, fontWeight: extraBold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'We recorded three negative mood entries in a row.\nHere are some suggestions to improve your mood.',
              style: blackTextStyle.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Go',
                    style: orangeTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        color: kOrangeColor,
                        size: 18,
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [header(), backIcon(), content1(), content2()],
    ));
  }
}
