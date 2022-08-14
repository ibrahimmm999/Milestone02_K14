import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:milestone/widgets/custom_header.dart';


class Journals extends StatelessWidget {
  final String day;
  final String content;

  const Journals({Key? key, this.day = '', this.content = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(day, style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold)),
          SizedBox(height: 4),
          Text(content, style: greyTextStyle.copyWith(fontSize: 12,fontWeight: reguler)),
          SizedBox(height: 15),
          Image.asset('assets/GoJournal.png',height: 13, width: 17),
          Divider(
            height: 30,
            indent: 25,
            endIndent: 25,
            thickness: 1,
          )
        ],
      )
    );
  }
}


class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override



  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Journal',
      );
    }

    Widget backIcon() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height:8),
              Container(
                margin: EdgeInsets.only(left: 25),
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage('assets/back_icon.png')),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(90),
                      bottom: Radius.circular(90),
                    )
                  ),
              ),
              SizedBox(height: 9),
            ]
          ),
        ),
      );
    }

    Widget journal1() {
      return Journals(
        day: 'Today',
        content: 'Lorem ipsum si dolor amet'
      );
    }

    Widget journal2() {
      return Journals(
          day: 'Yesterday',
          content: 'Lorem ipsum si dolor amet'
      );
    }

    Widget journal3() {
      return Journals(
          day: '1 August',
          content: 'Lorem ipsum si dolor amet'
      );
    }

    Widget journal4() {
      return Journals(
          day: '31 July',
          content: 'Lorem ipsum si dolor amet'
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          backIcon(),
          journal1(),
          journal2(),
          journal3(),
          journal4(),
        ]
      ),
    );
  }
}
