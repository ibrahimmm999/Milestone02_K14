import 'package:flutter/material.dart';
import 'package:milestone/models/course_model.dart';
import 'package:milestone/ui/subcourses2_page.dart';

import '../shared/theme.dart';

class SubCoursesPage extends StatelessWidget {
  final CourseModel course;
  SubCoursesPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerCourses() {
      return Container(
        padding: EdgeInsets.only(right: 9, left: 9, top: 14),
        width: double.infinity,
        height: 88,
        decoration: BoxDecoration(color: kWhiteColor),
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
                  color: kBlackColor,
                )),
            Text(
              'Courses',
              style: blackTextStyle.copyWith(fontSize: 20, fontWeight: medium),
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
                  color: kWhiteColor,
                )),
          ],
        ),
      );
    }

    Widget subcourse1() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubCourses2Page(
                        title: course.titleSub1,
                        videoUrl: course.videoUrl1,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
          padding: EdgeInsets.only(left: 20),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    offset: Offset(0, 12),
                    blurRadius: 30)
              ]),
          child: Row(children: [
            Container(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Satu',
                    style: blueTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    course.titleSub1,
                    style: blackTextStyle.copyWith(fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Container(
                    child: Text('Course 1'),
                    margin: EdgeInsets.only(top: 15),
                  )
                ],
              ),
            ),
            Container(
              width: 160,
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/subcourse1.png'),
                      fit: BoxFit.cover)),
            )
          ]),
        ),
      );
    }

    Widget subcourse2() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubCourses2Page(
                        title: course.titleSub2,
                        videoUrl: course.videoUrl2,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
          padding: EdgeInsets.only(left: 20),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    offset: Offset(0, 12),
                    blurRadius: 30)
              ]),
          child: Row(children: [
            Container(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dua',
                    style: blueTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    course.titleSub2,
                    style: blackTextStyle.copyWith(fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Container(
                    child: Text('Course 2'),
                    margin: EdgeInsets.only(top: 15),
                  )
                ],
              ),
            ),
            Container(
              width: 160,
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/subcourse2.png'),
                      fit: BoxFit.cover)),
            )
          ]),
        ),
      );
    }

    Widget subcourse3() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubCourses2Page(
                        title: course.titleSub3,
                        videoUrl: course.videoUrl3,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
          padding: EdgeInsets.only(left: 20),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    offset: Offset(0, 12),
                    blurRadius: 30)
              ]),
          child: Row(children: [
            Container(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tiga',
                    style: blueTextStyle.copyWith(fontSize: 13),
                  ),
                  Text(
                    course.titleSub3,
                    style: blackTextStyle.copyWith(fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Container(
                    child: Text('Course 3'),
                    margin: EdgeInsets.only(top: 15),
                  )
                ],
              ),
            ),
            Container(
              width: 160,
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/subcourse3.png'),
                      fit: BoxFit.cover)),
            )
          ]),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          headerCourses(),
          SizedBox(
            height: 20,
          ),
          subcourse1(),
          subcourse2(),
          subcourse3()
        ],
      ),
    );
  }
}
