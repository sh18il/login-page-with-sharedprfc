import 'package:flutter/material.dart';
import 'package:prjctlog/homescreen.dart';

import 'package:prjctlog/loginscreen.dart';
import 'package:prjctlog/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CheckUserlLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://i.pinimg.com/474x/02/f9/ae/02f9ae727a3f310c67265e798221adb9.jpg'),
          const Center(
              child: Text(
            'welcome',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ],
      ),
    );
  }

  Future<void> GotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
        (MaterialPageRoute(builder: (ctx) => const LoginScreen())));
  }

  Future<void> CheckUserlLogin() async {
    final sharedprfre = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfre.getBool(SAVE_KEY);
    if (userLoggedIn == null || userLoggedIn == false) {
      GotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
