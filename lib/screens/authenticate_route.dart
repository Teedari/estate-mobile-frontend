import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uenr_estate/controllers/authentication.dart';
import 'package:uenr_estate/controllers/user_controller.dart';
import 'package:uenr_estate/screens/home.dart';
import 'package:uenr_estate/screens/login.dart';

class AuthenticateUser extends StatelessWidget {
  const AuthenticateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return FutureBuilder(
        future: Authentication.userHasLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              userController.setUsername(Authentication.username);
              return const HomePage();
            }
          }
          return const Login();
        });
  }
}
