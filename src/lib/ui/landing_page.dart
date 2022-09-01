import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/sign_in_page.dart';
import 'package:milestone/ui/sign_up_page.dart';
import 'package:milestone/widgets/custom_button.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget mainScreen() {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/landing_page.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Spacer(flex: 5),
            CustomButton(
              buttonColor: kPinkColor,
              buttonText: 'Create Account',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                    (route) => false);
              },
              widthButton: 325,
              heightButton: 50,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonColor: kGreenColor,
              buttonText: 'Already have account? Sign In',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false);
              },
              widthButton: 325,
              heightButton: 50,
            ),
            Spacer(),
          ],
        ),
      );
    }

    return Stack(
      children: [
        mainScreen(),
      ],
    );
  }
}
