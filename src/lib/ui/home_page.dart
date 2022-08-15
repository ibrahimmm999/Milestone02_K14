import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/cubit/content_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/ui/journal_form.dart';
import 'package:milestone/ui/article_detail_page.dart';
import 'package:milestone/ui/article_page.dart';
import 'package:milestone/ui/courses_page.dart';
import 'package:milestone/ui/hotline_page.dart';
import 'package:milestone/ui/sign_in_page.dart';
import 'package:milestone/widgets/content_card.dart';
import 'package:milestone/widgets/custom_header.dart';
import 'package:milestone/widgets/mood_card.dart';
import 'package:bloc/bloc.dart';

import '../models/content_model.dart';
import '../widgets/log_out_button.dart';

import 'journal_page.dart';

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
      return customHeader(
        title: '',
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
            margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => JournalPage()));
                  },
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HotlinePage()));
                  },
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
            padding: EdgeInsets.only(
              left: 15,
              top: 5,
            ),
            height: 89,
            width: double.infinity,
            margin: EdgeInsets.only(right: 25, left: 25, bottom: 8),
            decoration: BoxDecoration(
                color: Color(0xffF8F6F6),
                borderRadius: BorderRadius.circular(10)),
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

    Widget articleOfTheDayTitle() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
            child: Row(
              children: [
                Text(
                  'Article of the Day',
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ArticlePage()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 109),
                      child: Row(
                        children: [
                          Text('See more',
                              style: blueTextStyle.copyWith(fontSize: 12)),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: kBlueColor,
                            size: 16,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget course() {
      return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => CoursesPage())));
        },
        child: Container(
          height: 151,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 100),
          decoration: BoxDecoration(
              color: kLightYellowColor,
              borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 23, right: 13, bottom: 7),
                width: 200,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Take a course on Journaling!',
                        style: darkBrownTextStyle.copyWith(
                            fontSize: 18, fontWeight: extraBold),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Lorem ipsum is the best',
                        overflow: TextOverflow.ellipsis,
                        style: darkBrownTextStyle.copyWith(
                            fontWeight: light, fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'View More',
                        style: orangeTextStyle.copyWith(
                            fontSize: 16, fontWeight: bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 13,
                height: 151,
              ),
              Container(
                height: 151,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/mind-8ec18.appspot.com/o/content%2Fcontent_2.png?alt=media&token=b33791b2-d8fb-4c15-89d7-5e75cf807e76'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      );
    }

    Widget articleOTD(List<ContentModel> contents) {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: contents.map((ContentModel content) {
              if (content.isMostViewed == true) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleDetailPage(
                                  title: content.title,
                                  content: content.subtitle,
                                  imageUrl: content.imageUrl)));
                    },
                    child: ContentCard(content));
              }
              return SizedBox();
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
              articleOfTheDayTitle(),
              articleOTD(state.content),
              sideContent(),
              course(),
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
