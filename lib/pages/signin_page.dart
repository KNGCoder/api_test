import 'package:api_test/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ///Initialize controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  /// [userLogin] function that handles the login
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    //final pin = await supabase.auth.reauthenticate();

    final user = res.user;
    return user?.id;
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

            ///Email TextInput
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller:  _emailController,
                decoration: const InputDecoration(label: Text('Email'),),
              ),
            ),
            smallGap,

            ///Password TextInput
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller:  _passwordController,
                decoration: const InputDecoration(label: Text('Password'),),
                obscureText: true,
              ),
              
            ),
            largeGap,
            ///Sign In Button
            isLoading 
              ? Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color:  Colors.white,
                  
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ) 
              :OutlinedButton(
               onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                dynamic loginValue = await userLogin(
                  email: _emailController.text, 
                  password: _passwordController.text);
                  setState(() {
                    isLoading = false;
                  });
                  if (loginValue != null) {
                    Navigator.pushReplacementNamed(context, '/simpleapp');
                  } else {
                    context.showErrorMessage('Invalid Email or Password!');
                  } 
               }, 
               child: const Text('Sign In')),
          ],
        ),
      ),
    );
  }
}