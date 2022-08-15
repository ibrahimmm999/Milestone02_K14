import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';

class SubCourses2Page extends StatelessWidget {
  const SubCourses2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appbar() {
      return Container(
        padding: const EdgeInsets.only(right: 9, left: 9, top: 14),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(color: kPinkColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {}
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 28,
                  color: kWhiteColor,
                )),
            Text(
              'Article',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            ),
            IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {}
                },
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  size: 28,
                  color: kPinkColor,
                )),
          ],
        ),
      );
    }

    Widget courseTitle() {
      return Container(
        margin: const EdgeInsets.only(right: 2, left: 2, top: 10),
        width: double.infinity,
        height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/subcourses_card.png',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mindful',
                  style: courseStyleTitle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 28.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Journaling',
                  style: courseStyleTitle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 28.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'SUBCOURSE',
                  style: courseStyleTitle.copyWith(fontSize: 11.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
          ],
        ),
      );
    }

    Widget courseContent() {
      return Container(
        height: 370,
        width: 300,
        margin: EdgeInsets.only(top: 15, left: 2, right: 2),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MINDFUL JOURNALING',
              style: courseStyleBlack.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 12.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'COURSE',
              style: courseStyleGrey.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 11.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'This is a',
              style: courseStyleBlack.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 34.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Subcourse',
              style: courseStyleBlack.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 34.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Yay!',
              style: courseStyleBlack.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 34.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Subcourse',
              style: courseStyleGrey.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'One',
              style: courseStyleGrey.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Begin',
              style: courseStyleGrey.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Learning',
              style: courseStyleGrey.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'LEARN NOW!',
              style: courseStylePurple.copyWith(
                  fontWeight: FontWeight.w100, fontSize: 14.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
      );
    }

    return Scaffold(
      backgroundColor: kPinkColor,
      body: ListView(
        children: [
          appbar(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Column(
                children: [courseTitle(), courseContent()],
              ))
        ],
      ),
    );
  }
}
