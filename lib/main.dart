import 'package:flutter/material.dart';
import 'package:uenr_estate/screens/allowance.dart';
import 'package:uenr_estate/screens/authenticate_route.dart';
import 'package:uenr_estate/screens/complaint.dart';
import 'package:uenr_estate/screens/home.dart';
import 'package:uenr_estate/screens/login.dart';
import 'package:uenr_estate/screens/notice.dart';
import 'package:uenr_estate/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/authenticateUser': (context) => const AuthenticateUser(),
        '/login': (context) => const Login(),
        '/home': (context) => const HomePage(),
        '/allowance': (context) => const Allowance(),
        '/notice': (context) => const Notice(),
        '/complaint': (context) => const Complaint(),
      },
    );
  }
}
