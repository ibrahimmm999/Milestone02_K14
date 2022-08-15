import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../shared/theme.dart';

class SubCourses2Page extends StatefulWidget {
  final String videoUrl;
  final String title;
  SubCourses2Page({Key? key, required this.videoUrl, required this.title})
      : super(key: key);

  @override
  State<SubCourses2Page> createState() => _SubCourses2PageState();
}

class _SubCourses2PageState extends State<SubCourses2Page> {
  late YoutubePlayerController ytController;
  TextEditingController linkController = TextEditingController();
  TextEditingController seekController = TextEditingController();

  @override
  void initState() {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
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
              widget.title,
              style: brownTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  size: 28,
                  color: kWhiteColor,
                )),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          SizedBox(
            height: 50,
          ),
          Wrap(
            children: [
              YoutubePlayer(
                controller: ytController,
                showVideoProgressIndicator: true,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 25),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Title:',
          //         style: blackTextStyle.copyWith(
          //             fontSize: 18, fontWeight: semiBold),
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Text(ytController.metadata.title,
          //           style: darkGreyTextStyle.copyWith(fontSize: 14)),
          //       SizedBox(
          //         height: 18,
          //       ),
          //       Text(
          //         'Channel:',
          //         style: blackTextStyle.copyWith(
          //             fontSize: 18, fontWeight: semiBold),
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Text(
          //         ytController.metadata.author,
          //         style: darkGreyTextStyle,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
