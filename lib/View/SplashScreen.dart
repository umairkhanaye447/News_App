import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/View/HomeSCreen.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({super.key});

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offAll(const Homescreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_pic.jpg',
              fit: BoxFit.cover,
              width: width * .9,
              height: height * .5,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'WELCOME TO THE WORLD OF HEADLINES',
              style: GoogleFonts.anton(
                  letterSpacing: .6, color: Colors.grey.shade700),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
