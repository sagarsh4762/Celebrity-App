import 'dart:async';

import 'package:celebrity_details/view/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
        return HomePage();
      })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: const Center(
          child: Text(
            'Celebrity Detail App',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: "Source Sans Pro",
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
