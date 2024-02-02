import 'package:api_test/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:api_test/pages/simpleapp_page.dart';
import 'package:api_test/pages/home_page.dart';
import 'package:api_test/pages/signup_page.dart';
import 'package:api_test/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://xnmmbtozblayxzbrtscj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhubW1idG96YmxheXh6YnJ0c2NqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY2ODUxOTAsImV4cCI6MjAyMjI2MTE5MH0.XFt0pUHX64wPxaexMF-Y6OlYwtH_lq0hRbfFIlkK02o',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'app',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      initialRoute: client.auth.currentSession != null ? 'app' : '/',
      routes:  {
        '/' :(context) => const HomePage(),
        '/signIn' :(context) => const SignInPage(),
        '/signUp' :(context) => const SignUpPage(),
        '/simpleapp' :(context) => const SimpleAppPage(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
