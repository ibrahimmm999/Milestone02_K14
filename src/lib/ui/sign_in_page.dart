import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_button.dart';
import 'package:milestone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    Widget appBar() {
      return CustomAppBar(
        title: 'Sign In',
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign In',
                style: blackTextStyle.copyWith(
                  fontSize: 28,
                  fontWeight: reguler,
                )),
            SizedBox(
              height: 14,
            ),
            Text(
              'Enter your email and password for\nsigning in. Thanks',
              style: greyTextStyle.copyWith(fontSize: 17, fontWeight: light),
            )
          ],
        ),
      );
    }

    Widget inputSection() {
      Widget inputEmail() {
        return CustomTextFormField(
          text: 'Email Address',
          hintText: 'Your Email',
          controller: emailController,
        );
      }

      Widget inputPassword() {
        return CustomTextFormField(
          controller: passwordController,
          text: 'Password',
          hintText: 'Your Password',
          obscureText: true,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/transition-page', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: kBlackColor,
                ),
              );
            }
            return CustomButton(
              buttonText: 'Sign In',
              buttonColor: kPinkColor,
              heightButton: 55,
              widthButton: double.infinity,
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      Widget signUpButton() {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline,
                ),
              )),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputEmail(),
            inputPassword(),
            submitButton(),
            signUpButton()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          appBar(),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title(), inputSection()],
              ))
        ],
      ),
    );
  }
}
