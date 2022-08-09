import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:milestone/ui/home_page.dart';

class TransitionPage extends StatefulWidget {
  const TransitionPage({Key? key}) : super(key: key);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => HomePage())),
        ModalRoute.withName('/home'),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash_page.png'),
                  fit: BoxFit.cover)),
        ));
  }
}
