import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/settings_detail_page.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_button.dart';

class ProfileInformationPage extends StatelessWidget {
  const ProfileInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return CustomAppBar(title: '');
    }

    Widget content() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Profile Information',
                style:
                    blackTextStyle.copyWith(fontSize: 24, fontWeight: medium),
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
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: kLightBrown),
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.only(left: 25, right: 25),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name:',
                          style: blackTextStyle.copyWith(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.user.name,
                          style: blackTextStyle.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Email:',
                          style: blackTextStyle.copyWith(fontSize: 20),
                        ),
                        Text(state.user.email,
                            style: blackTextStyle.copyWith(fontSize: 14),
                            overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      );
    }

    Widget editProfileButton() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        child: CustomButton(
          buttonColor: kGreenColor,
          buttonText: 'Edit Profile',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsDetailPage()));
          },
          heightButton: 55,
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [header(), content(), editProfileButton()],
    ));
  }
}
