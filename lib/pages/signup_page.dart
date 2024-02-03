import 'dart:async';

import 'package:api_test/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ///Initialize controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///[createUser] function that user creation
  FutureOr<bool?> createUser({
    required final String email,
    required final String password,

  }) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email, 
      password: password,
      // data: {'username': 'my_user_name'},
      );
      // final Session? session = res.session;
      // final User? user = res.user;

      // final error = res.error;
      // if (error == null) {
      //   return true;
      // } else {
      //   return false;
      // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Icon
            const Icon(Icons.sailing_rounded, size: 150, color: Colors.grey,),
            largeGap,

            ///Email Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller:  _emailController,
                decoration: const InputDecoration(label: Text('Email'),),
              ),
            ),
            smallGap,
            ///Password Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller:  _passwordController,
                decoration: const InputDecoration(label: Text('Password'),),
                // obscureText: true,
              ),
              
            ),
            largeGap,
            ///SignUp Button
            OutlinedButton(
              onPressed: () async {
                final userValue = await createUser(
                  email: _emailController.text, 
                  password: _passwordController.text);
                  if (userValue == true) {
                    Navigator.pushReplacementNamed(context, '/signIn');
                    context.showErrorMessage('Success');
                  }
              }, 
              child: const Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}