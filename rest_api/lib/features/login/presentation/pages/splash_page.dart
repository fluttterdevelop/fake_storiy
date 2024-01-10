
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/main/presentation/main_screen.dart';

import '../../../home/presentation/home_page.dart';
import '../bloc/auth/authentication_bloc.dart';
import '../login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state.authenticationStatus ==
              AuthenticationStatus.unauthenticated) {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
            );
          } else {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => const MainScreen()),
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state.authenticationStatus == AuthenticationStatus.unknown) {
            context
                .read<AuthenticationBloc>()
                .add(const AuthenticationEvent.getAuthenticationStatus());
          }
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      );
}
