import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_header.dart';

class JournalDetailPage extends StatelessWidget {
  const JournalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Journal',
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
            margin: EdgeInsets.only(left: 35, bottom: 10),
            height: 24.5,
            width: 31,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/back_icon.png'))),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              'My Journal\n3rd of May 2022',
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              'I woke up at 6 oclock in the morning. We had breakfast and dressed up. Today we all went to Fantasize Amusement park near Pune. We started from home at 7 oclock. As soon as we reached there, we bought our tickets and went inside. I was so excited seeing the rides. My parents and brother liked the Thunderfall ride. My favorite rides were Water Splash, Caterpillar Ride, Wave Pool and Pirate Ship. After a couple of hours, we had our lunch. In the afternoon we had the scariest ride that is the Space Gun. We got back to our home in the evening. It was a great day and I enjoyed a lot.\nSammy.',
              style: blackTextStyle.copyWith(fontSize: 12),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [header(), backIcon(), content()],
      ),
    );
  }
}
