import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 9, left: 9, top: 14),
      width: double.infinity,
      height: 88,
      decoration: BoxDecoration(color: kLightBrown),
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
            title,
            style: brownTextStyle.copyWith(fontSize: 18, fontWeight: bold),
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
}
