import 'package:flutter/material.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinePage extends StatelessWidget {
  const HotlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Hotline',
      );
    }

    Widget backIcon() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 35),
            height: 24.5,
            width: 31,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/back_icon.png'))),
          ),
        ),
      );
    }

    Widget subtitle() {
      return Center(
        child: Container(
          height: 70,
          width: 235,
          margin: EdgeInsets.only(top: 18, bottom: 40),
          child: Text(
            'Mind.id’s Hotline\nfor Mental Help',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget callButton() {
      return GestureDetector(
        onTap: () async {
          await launch('tel:021-909904854');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          height: 83,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/container_card.png')),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Image(
                image: AssetImage('assets/phone_icon.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '021-909904854',
                style: darkBrownTextStyle.copyWith(
                    fontSize: 24.5, fontWeight: extraBold),
              )
            ],
          ),
        ),
      );
    }

    Widget emailButton() {
      return GestureDetector(
        onTap: () async {
          await launch("mailto:cs@mind.id");
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          height: 83,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/container_card.png')),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Image(
                image: AssetImage('assets/gmail_icon.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'cs@mind.id',
                style: darkBrownTextStyle.copyWith(
                    fontSize: 24.5, fontWeight: extraBold),
              )
            ],
          ),
        ),
      );
    }

    Widget whatsAppButton() {
      return GestureDetector(
        onTap: () async {
          await launch("https://wa.me/6281734063953/");
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          height: 83,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/container_card.png')),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Image(
                image: AssetImage('assets/whatsapp_icon.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '0817-3406-3953',
                style: darkBrownTextStyle.copyWith(
                    fontSize: 24.5, fontWeight: extraBold),
              )
            ],
          ),
        ),
      );
    }

    Widget instagramButton() {
      return GestureDetector(
        onTap: () {
          launch('https://www.instagram.com/mind_id');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          height: 83,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/container_card.png')),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 22,
              ),
              Image(
                image: AssetImage('assets/instagram_icon.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '@mind_id',
                style: darkBrownTextStyle.copyWith(
                    fontSize: 24.5, fontWeight: extraBold),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          backIcon(),
          subtitle(),
          callButton(),
          whatsAppButton(),
          emailButton(),
          instagramButton(),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
