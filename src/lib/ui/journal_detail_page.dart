import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_header.dart';

class JournalDetailPage extends StatelessWidget {
  final String title;
  final String contentJournal;
  const JournalDetailPage(
      {Key? key, required this.title, required this.contentJournal})
      : super(key: key);

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
              title,
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 29,
            ),
            Text(
              contentJournal,
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
