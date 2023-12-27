import 'package:flutter/material.dart';
import 'package:zipper/screens/home.dart';
import 'package:zipper/screens/login.dart';
import 'package:zipper/screens/profile.dart';
import 'package:zipper/screens/mapscreens/booking.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       // backgroundColor: Colors.blueAccent,
        useMaterial3: false,
      ),
      home: const MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            
            const Text(
              'Zipper',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
