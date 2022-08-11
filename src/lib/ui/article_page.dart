import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_header.dart';

import '../cubit/content_cubit.dart';
import '../models/content_model.dart';
import '../shared/theme.dart';
import '../widgets/content_card.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    context.read<ContentCubit>().fetchContent();
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget header() {
      return customHeader(
        title: 'Article',
      );
    }

    Widget backIcon() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.only(left: 25),
          height: 24.5,
          width: 31,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/back_icon.png'))),
        ),
      );
    }

    Widget articleList(List<ContentModel> contents) {
      return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: contents.map((ContentModel content) {
            return ContentCard(content);
          }).toList(),
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header(), backIcon(), articleList(state.content)],
            ),
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
