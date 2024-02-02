import 'package:flutter/material.dart';
import 'package:api_test/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Icon
              const Icon(
                Icons.sailing_rounded, 
                size: 150, 
                color: Colors.black54, ),
              smallGap,

              ///Text
              const Text(
                'Simple App', 
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black38
              ),),
              largeGap,

              ///Sign In Button
              OutlinedButton(onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              }, child: const Text('Sign In'),),
              smallGap ,
              ///Sign Up Button
              OutlinedButton(onPressed: () {
                Navigator.pushNamed(context, '/signUp');}, 
                            child: const Text('Sign Up'),),
            ],
          ) ,),
    );
  }
}