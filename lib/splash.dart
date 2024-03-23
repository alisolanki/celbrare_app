// ignore_for_file: prefer_const_constructors

import 'package:celbrare_app/home_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('splash screen'),
          ),
          Image.asset('assets/images/celebrare.jpeg'),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
