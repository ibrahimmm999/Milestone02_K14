import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../shared/theme.dart';
import 'custom_button.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 150, left: 80, right: 80),
            child: CustomButton(
                buttonColor: kGreenColor,
                heightButton: 55,
                widthButton: double.infinity,
                buttonText: 'Log Out',
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                }),
          ),
        );
      },
    );
  }
}
