import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/landing-page', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
            context, '/transition-page', (route) => false);
      }
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
