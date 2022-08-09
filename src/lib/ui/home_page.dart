import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/sign_in_page.dart';
import 'package:milestone/widgets/content_tile.dart';
import 'package:milestone/widgets/mood_card.dart';
import 'package:bloc/bloc.dart';

import '../models/content_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: 25, left: 25, top: 45, bottom: 24),
        height: 98,
        child: Row(children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/profile_pic.png'),
                    fit: BoxFit.cover)),
          ),
          Spacer(),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/notif_vector.png'))),
          ),
          SizedBox(
            width: 23.5,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/setting_vector.png'))),
            ),
          ),
        ]),
      );
    }

    Widget title() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Afternoon,',
                    style: blackTextStyle.copyWith(
                        fontSize: 26, fontWeight: medium),
                  ),
                  Text(
                    '${state.user.name}',
                    style:
                        blackTextStyle.copyWith(fontSize: 26, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    'How are you feeling today ?',
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ));
        } else {
          return SizedBox();
        }
      });
    }

    Widget moodList() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MoodCard(urlImage: 'assets/happy_icon.png'),
              MoodCard(urlImage: 'assets/calm_icon.png'),
              MoodCard(urlImage: 'assets/manic_icon.png'),
              MoodCard(urlImage: 'assets/angry_icon.png'),
              MoodCard(urlImage: 'assets/sad_icon.png'),
            ],
          ),
        ),
      );
    }

    Widget content(List<ContentModel> contents) {
      return SingleChildScrollView(
        child: Column(
          children: [],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [header(), title(), moodList()],
      ),
    );
  }
}
