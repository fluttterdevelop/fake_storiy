import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/presentation/bloc/auth/authentication_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 670,
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.maxFinite,
            child: MaterialButton(
              onPressed: (){
                context.read<AuthenticationBloc>().add(const AuthenticationEvent.logout());
                },
              color: Colors.red,
              child: Text('Logout'),
            ),
          ),
        ),
      ),
    ]));
  }
}
