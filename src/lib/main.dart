import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milestone/ui/landing_page.dart';
import 'package:milestone/ui/notifications_page.dart';
import 'package:milestone/ui/settings_page.dart';
import 'package:milestone/ui/sign_in_page.dart';
import 'package:milestone/ui/sign_up_page.dart';
import 'package:milestone/ui/splash_page.dart';
import 'package:milestone/ui/courses_page.dart';
import 'package:milestone/ui/subcourses_page.dart';
import 'package:milestone/ui/transition_page.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/content_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ContentCubit()),
      ],
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/landing-page': (context) => LandingPage(),
          '/transition-page': (context) => TransitionPage(),
          '/settings-page': (context) => SettingsPage(),
          '/notifications-page': (context) => NotificationsPage(),
          '/couses-page': (context) => CoursesPage(),
          '/subcourses-page': (context) => SubCoursesPage(),

          //'/main': (context) => MainPage(),
        },
      ),
    );
  }
}
