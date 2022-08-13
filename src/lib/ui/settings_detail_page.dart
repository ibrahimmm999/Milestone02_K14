import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_appbar.dart';

class SettingsDetailPage extends StatelessWidget {
  SettingsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return CustomAppBar(
        title: "Settings Detail",
      );
    }

    Widget logo() {
      return Container(
        margin: EdgeInsets.only(top: 100, left: 25, right: 25),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/setting_detail_vector.png'))),
        ),
      );
    }

    Widget caption() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Text('This is a settings detail.\n- Team MIND -',
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontSize: 28,
              fontWeight: reguler,
              color: kWhiteColor,
            )),
      );
    }

    return Scaffold(
        backgroundColor: kLightBrown,
        body: ListView(children: [appBar(), logo(), caption()]));
  }
}
