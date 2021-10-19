import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uenr_estate/helpers/apis/api.dart';
import 'package:http/http.dart' as http;
import 'package:uenr_estate/helpers/local_data/shared_helper.dart';

class UserController extends GetxController {
  var username = ''.obs;
  setUsername(String name) {
    username.value = name;
  }

  String get user =>
      username.split('')[0].toUpperCase() +
      '' +
      username.split('')[username.toString().length - 1].toUpperCase();

  loginUser(BuildContext context,
      {Map<String, dynamic>? data, Function? cb}) async {
    await http.post(Api.loginUrl, body: data).then((res) {
      if (res.statusCode == 201) {
        LocalData.setLocalData(
            'token', jsonDecode(utf8.decode(res.bodyBytes))['token']);
        LocalData.setLocalData('username', data!['username']);
        setUsername(data['username']);
        Navigator.of(context).popAndPushNamed('/authenticateUser');
      }

      cb!();
    });
  }
}
