import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key? key,
      this.text = '',
      this.hintText = '',
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: blackTextStyle,
          ),
          SizedBox(
            height: 6,
          ),
          TextFormField(
              controller: controller,
              obscureText: obscureText,
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: blackTextStyle,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(defaultRadius)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(61, 228, 228, 228))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      borderSide: BorderSide(color: kBlackColor)))),
        ],
      ),
    );
  }
}
