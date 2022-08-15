import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/ui/home_page.dart';
import 'package:milestone/ui/change_password_page.dart';
import 'package:milestone/ui/settings_detail_page.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_settingbutton.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/custom_button.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 28,
                  color: kWhiteColor,
                )),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings',
                style: blackTextStyle.copyWith(
                  fontSize: 44,
                  fontWeight: reguler,
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/setting_vector.png'))),
            ),
          ],
        ),
      );
    }

    Widget settingsList() {
      return Container(
          width: double.infinity,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Account Settings",
                      style: purpleTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: reguler,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        SettingsButton(
                          buttonText: "Profile Information",
                          buttonDesc: "Name, Email, Security",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/profileset.png',
                        ),
                        SettingsButton(
                          buttonText: "Contents",
                          buttonDesc: "Control your contents",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/contentset.png',
                        ),
                        SettingsButton(
                          buttonText: "Name, Email, Security",
                          buttonDesc: "Change your current password",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordPage()));
                          },
                          imagefile: 'assets/passwordset.png',
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Notification Settings",
                      style: purpleTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: reguler,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        SettingsButton(
                          buttonText: "Push Notifications",
                          buttonDesc: "New Contracts Sign or Send",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/notifset.png',
                        ),
                      ],
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("General",
                      style: purpleTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: reguler,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 48),
                    child: Column(
                      children: [
                        SettingsButton(
                          buttonText: "Rate our App",
                          buttonDesc: "Rate and review us!",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/rateset.png',
                        ),
                        SettingsButton(
                          buttonText: "Send Feedback",
                          buttonDesc: "Share your thoughts",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/feedbset.png',
                        ),
                        SettingsButton(
                          buttonText: "Privacy Policy",
                          buttonDesc: "Read our privacy policy",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingsDetailPage()));
                          },
                          imagefile: 'assets/priposet.png',
                        ),
                      ],
                    )),
              ])));
    }

    Widget logOut() {
      return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Container(
              margin: EdgeInsets.only(bottom: 50, left: 80, right: 80),
              child: TextButton(
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                  child: Text(
                    'Log Out',
                    style: redTextStyle.copyWith(
                        decoration: TextDecoration.underline),
                  ))),
        );
      });
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          appBar(),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title(), settingsList(), logOut()],
              ))
        ],
      ),
    );
  }
}
