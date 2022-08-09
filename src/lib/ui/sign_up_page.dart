import 'package:milestone/cubit/auth_cubit.dart';
import 'package:milestone/shared/theme.dart';
import 'package:milestone/widgets/custom_appbar.dart';
import 'package:milestone/widgets/custom_button.dart';
import 'package:milestone/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return CustomAppBar(title: 'Sign Up');
    }

    Widget inputSection() {
      Widget inputName() {
        return CustomTextFormField(
          text: 'Name',
          hintText: 'Your Name',
          controller: nameController,
        );
      }

      Widget inputEmail() {
        return CustomTextFormField(
          text: 'Email address',
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
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              buttonColor: kPinkColor,
              buttonText: 'Create Account',
              heightButton: 55,
              widthButton: 325,
              onPressed: () {
                context.read<AuthCubit>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                    );
              },
            );
          },
        );
      }

      Widget signInButton() {
        return CustomButton(
          buttonColor: kGreenColor,
          onPressed: () {
            Navigator.pushNamed(context, '/sign-in');
          },
          buttonText: 'Have an account? Sign In',
          heightButton: 55,
          widthButton: 325,
        );
      }

      Widget signIButton() {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Have an account? Sign In',
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
            inputName(),
            inputEmail(),
            inputPassword(),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  submitButton(),
                  SizedBox(
                    height: 20,
                  ),
                  signInButton()
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [appBar(), inputSection()],
        ),
      ),
    );
  }
}
