import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';

class customHeader extends StatelessWidget {
  final String title;
  const customHeader({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 25, left: 25, top: 45, bottom: 20),
      height: 98,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/profile_pic.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          child: Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 20),
          ),
        ),
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/notif_vector.png'))),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings-page');
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/setting_vector.png'))),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
