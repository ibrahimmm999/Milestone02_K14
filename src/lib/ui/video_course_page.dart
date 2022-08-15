import 'package:flutter/material.dart';
import 'package:milestone/widgets/custom_appbar.dart';

class VideoCoursePage extends StatefulWidget {
  String videoUrl;
  VideoCoursePage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoCoursePage> createState() => _VideoCoursePageState();
}

class _VideoCoursePageState extends State<VideoCoursePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return CustomAppBar(title: 'Video');
    }

    Widget content() {
      return Flexible(child: Container());
    }

    return Scaffold(
      body: ListView(
        children: [header()],
      ),
    );
  }
}
