import 'package:milestone/models/content_model.dart';
import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  final ContentModel content;
  const ContentTile(
    this.content, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image:
                      DecorationImage(image: NetworkImage(content.imageUrl))),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.title,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    content.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
