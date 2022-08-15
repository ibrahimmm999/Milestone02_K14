import 'package:milestone/models/content_model.dart';
import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final ContentModel content;
  const ContentCard(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget articleContent() {
      return Container(
        height: 151,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        decoration: BoxDecoration(
            color: kLightYellowColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 23, right: 13, bottom: 7),
              width: 200,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.title,
                      style: darkBrownTextStyle.copyWith(
                          fontSize: 18, fontWeight: extraBold),
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      content.subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: darkBrownTextStyle.copyWith(
                          fontWeight: light, fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'View More',
                      style: orangeTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13,
              height: 151,
            ),
            Container(
              height: 151,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: NetworkImage(content.imageUrl),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [articleContent()],
      ),
    );
  }
}
