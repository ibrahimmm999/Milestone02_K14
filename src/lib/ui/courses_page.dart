import 'package:flutter/material.dart';
import 'package:milestone/ui/sub_courses_page.dart';
import 'package:milestone/ui/subcourses2_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/widgets/custom_appbar.dart';

import '../cubit/course_cubit.dart';
import '../models/course_model.dart';
import '../shared/theme.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    context.read<CourseCubit>().fetchCourse();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget header() {
      return CustomAppBar(title: 'Courses');
    }

    Widget courseList(List<CourseModel> courses) {
      return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: courses.map((CourseModel course) {
            return GestureDetector(
              child: Container(
                width: 400,
                height: 270,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: NetworkImage(course.thumbnail))),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCoursesPage(
                              course: course,
                            )));
              },
            );
          }).toList(),
        ),
      );
    }

    return BlocConsumer<CourseCubit, CourseState>(listener: (context, state) {
      // TODO: implement listener
      if (state is CourseFailed) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
          backgroundColor: kRedColor,
        ));
      }
    }, builder: (context, state) {
      if (state is CourseSuccess) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header(), courseList(state.course)],
            ),
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
