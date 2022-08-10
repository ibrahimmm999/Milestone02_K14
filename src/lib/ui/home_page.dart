import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/cubit/content_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/sign_in_page.dart';
import 'package:milestone/widgets/content_tile.dart';
import 'package:milestone/widgets/mood_card.dart';
import 'package:bloc/bloc.dart';

import '../models/content_model.dart';
import '../widgets/log_out_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ContentCubit>().fetchContent();
    super.initState();
  }

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
            onTap: () {
              Navigator.pushNamed(context, '/settings-page');
            },
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

    Widget sideContent() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 25, right: 25, top: 26, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 62,
                    width: 155,
                    padding: EdgeInsets.only(
                        left: 15, top: 19, bottom: 21, right: 45),
                    decoration: BoxDecoration(
                        color: Color(0xffF4F3F1),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Container(
                          height: 22,
                          width: 21,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/journal_vector.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Spacer(),
                        Text(
                          'Journal',
                          style: darkBrownTextStyle.copyWith(fontWeight: bold),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 62,
                    width: 155,
                    padding: EdgeInsets.only(
                        left: 15, top: 19, bottom: 21, right: 45),
                    decoration: BoxDecoration(
                        color: Color(0xffF4F3F1),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: Color(0xffC3C3C3), size: 23),
                        Spacer(),
                        Text(
                          'Hotline',
                          style: darkBrownTextStyle.copyWith(fontWeight: bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 21),
            height: 79,
            width: double.infinity,
            margin: EdgeInsets.only(right: 25, left: 25, bottom: 8),
            decoration: BoxDecoration(color: Color(0xffF4F4F4)),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 258,
                  child: Text(
                      '“Mental health is not a destination, it’s a process. It’s about how you drive, not where you’re going”',
                      style: darkGreyTextStyle),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 24,
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/quote_icon.png'))),
                )
              ],
            ),
          )
        ],
      );
    }

    Widget content(List<ContentModel> contents) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 26, bottom: 30),
          child: Column(
            children: contents.map((ContentModel content) {
              return ContentTile(content);
            }).toList(),
          ),
        ),
      );
    }

    return BlocConsumer<ContentCubit, ContentState>(listener: (context, state) {
      // TODO: implement listener
      if (state is ContentFailed) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
          backgroundColor: kRedColor,
        ));
      }
    }, builder: (context, state) {
      if (state is ContentSuccess) {
        return Scaffold(
          body: ListView(
            children: [
              header(),
              title(),
              moodList(),
              sideContent(),
              content(state.content),
              LogOutButton()
            ],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
