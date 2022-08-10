
import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_settingbutton.dart';

class SettingsPage extends StatelessWidget{
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    Widget appBar(){
      return CustomAppBar(
        title: "Settings",
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
            child: Column(
                children: [
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
                            onPressed: (){},
                            imagefile: 'assets/profileset.png',
                          ),
                          SettingsButton(
                            buttonText: "Contents",
                            buttonDesc: "Control your contents",
                            onPressed: (){},
                            imagefile: 'assets/contentset.png',
                          ),
                          SettingsButton(
                            buttonText: "Name, Email, Security",
                            buttonDesc: "Change your current password",
                            onPressed: (){},
                            imagefile: 'assets/passwordset.png',
                          ),
                        ],
                      )
                  ),

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
                            onPressed: (){},
                            imagefile: 'assets/notifset.png',
                          ),
                        ],
                      )
                  ),

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
                            onPressed: (){},
                            imagefile: 'assets/rateset.png',
                          ),
                          SettingsButton(
                            buttonText: "Send Feedback",
                            buttonDesc: "Share your thoughts",
                            onPressed: (){},
                            imagefile: 'assets/feedbset.png',
                          ),
                          SettingsButton(
                            buttonText: "Privacy Policy",
                            buttonDesc: "Read our privacy policy",
                            onPressed: (){},
                            imagefile: 'assets/priposet.png',
                          ),
                        ],
                      )
                  ),
                ]
            )
      )
      );
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
                children: [title(),
                settingsList()],
              ))
        ],
      ),
    );
  }
}