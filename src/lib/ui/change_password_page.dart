import 'package:flutter/material.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_button.dart';

import '../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return CustomAppBar(title: '');
    }

    Widget body() {
      return Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.only(left: 25),
          child: Text(
            'Change Your Password',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: medium),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Icon(
            Icons.account_circle,
            size: 100,
          ),
        ),
        SizedBox(
          height: 50,
        )
      ]));
    }

    Widget inputNewPassword() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: CustomTextFormField(
          controller: passwordController,
          text: 'New Password',
          hintText: 'New Password...',
          obscureText: true,
        ),
      );
    }

    Widget inputConfrimPassword() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: CustomTextFormField(
          controller: passwordController,
          text: 'Confirm Password',
          hintText: 'Confirm Password...',
          obscureText: true,
        ),
      );
    }

    Widget submitButton() {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 70, vertical: 40),
          child: CustomButton(
            buttonColor: kRedColor,
            onPressed: () {},
            heightButton: 55,
            buttonText: 'Submit',
          ));
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          body(),
          inputNewPassword(),
          inputConfrimPassword(),
          submitButton()
        ],
      ),
    );
  }
}
