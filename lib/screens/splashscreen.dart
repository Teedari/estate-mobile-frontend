import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uenr_estate/widgets/appversion.dart';
import 'package:uenr_estate/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 8), (timer) {
      Navigator.of(context).popAndPushNamed('/authenticateUser');
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/building.jpg'))),
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Opacity(opacity: .9, child: Container(color: Colors.white)),
                const AppVersion(),
                const Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Center(child: CircularProgressIndicator())),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Logo(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
