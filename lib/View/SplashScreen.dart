import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_per/Utils/AppColor.dart';
import 'package:uni_per/View/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarySwatchColor,
      body: Center(
        child: Image.asset("assets/images/uni_per_logo.png"),
      ),
    );
  }
}
