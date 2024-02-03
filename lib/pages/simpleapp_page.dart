import 'package:api_test/utils/constant.dart';
import 'package:flutter/material.dart';

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({super.key});

  @override
  State<SimpleAppPage> createState() => _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                supabase.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, 
              icon: const Icon(Icons.logout),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Icon
            const Icon(
              Icons.sailing_rounded, 
              size: 150, 
              color: Colors.grey,),
            largeGap,
            ///Text
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 50,
                ),
            ),
            
            Text(
              'Hello! ${supabase.auth.currentUser?.email}',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 17,
                ),
            ),
            largeGap,
            ///Sign Out Button
            OutlinedButton(onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }, child: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }
}