import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';

class SubCoursesPage extends StatelessWidget {
  const SubCoursesPage({Key? key}) : super(key: key);

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
          margin: const EdgeInsets.only(right: 2, left: 2, top: 25),
          width: double.infinity,
          height: double.infinity,
          child: const Image(image: AssetImage('assets/subcourses_card.png')));
    }

    Widget courseContent() {
      return Container();
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
                children: [courseTitle(), courseContent()]))
        ],
      ),
    );
  }
}
