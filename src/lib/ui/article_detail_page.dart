import 'package:flutter/material.dart';
import 'package:milestone/models/content_model.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_header.dart';

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  const ArticleDetailPage(
      {Key? key,
      required this.title,
      required this.content,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Article',
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
            margin: EdgeInsets.only(left: 35, bottom: 13),
            height: 24.5,
            width: 31,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/back_icon.png'))),
          ),
        ),
      );
    }

    Widget imageContent() {
      return Container(
        margin: EdgeInsets.only(bottom: 19),
        height: 247,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      );
    }

    Widget titleContent() {
      return Container(
        margin: EdgeInsets.only(right: 25, left: 25, bottom: 11),
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 30, fontWeight: bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget contentArticle() {
      return Container(
        child: Text(
          content,
          style: blackTextStyle.copyWith(fontSize: 13),
        ),
        margin: EdgeInsets.only(right: 25, left: 25, bottom: 50),
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        header(),
        imageContent(),
        backIcon(),
        titleContent(),
        contentArticle()
      ],
    ));
  }
}
