import 'package:flutter/material.dart';

import '../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final double heightButton;
  final double widthButton;
  final Color buttonColor;

  const CustomButton(
      {Key? key,
      required this.buttonColor,
      this.buttonText = '',
      this.widthButton = 0.0,
      required this.onPressed,
      this.heightButton = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthButton,
      height: heightButton,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius)))),
    );
  }
}
