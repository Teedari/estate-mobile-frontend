// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uenr_estate/controllers/user_controller.dart';
import 'package:uenr_estate/helpers/apis/api.dart';
import 'package:uenr_estate/helpers/local_data/shared_helper.dart';
import 'package:uenr_estate/widgets/appversion.dart';
import 'package:uenr_estate/widgets/inputtext.dart';
import 'package:uenr_estate/widgets/logo.dart';
// import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool hasError = false;
  var userController = UserController();

  // loginUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await http
  //       .post(Api.loginUrl,
  //           body: {'username': _username.text, 'password': _password.text})
  //       .then((res) => {
  //             print(res.statusCode),
  //             if (res.statusCode == 201)
  //               {
  //                 LocalData.setLocalData(
  //                     'token', jsonDecode(utf8.decode(res.bodyBytes))['token']),
  //                 LocalData.setLocalData('username', _username.text),
  //                 Navigator.of(context).popAndPushNamed('/authenticateUser')
  //               },
  //             setState(() {
  //               isLoading = false;
  //             })
  //           })
  //       .catchError((err) {
  //         setState(() {
  //           isLoading = false;
  //           hasError = true;
  //         });
  //       });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const LoadingPage()
          : SafeArea(
              child: Stack(
                children: [
                  const AppVersion(),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                          ),
                          const Logo(),
                          const Text(
                            'Sign In to continue',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          FormField(
                              onSaved: (data) => {},
                              builder: (FormFieldState state) {
                                return Column(
                                  children: [
                                    InputText(
                                      hint: 'Enter username here',
                                      controller: _username,
                                      labelText: 'Username',
                                    ),
                                    InputText(
                                      hint: 'Enter password here',
                                      controller: _password,
                                      labelText: 'Password',
                                      isPassword: true,
                                    ),
                                    const SizedBox(height: 20),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .8,
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              var data = {
                                                'username': _username.text,
                                                'password': _password.text
                                              };
                                              userController.loginUser(context,
                                                  data: data, cb: () {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blue[800]),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 20),
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 23),
                                              ),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    hasError
                                        ? const Text('Invalid credentials',
                                            style: TextStyle(color: Colors.red))
                                        : const Offstage()
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text('loading...')
          ],
        ),
      ),
    );
  }
}
