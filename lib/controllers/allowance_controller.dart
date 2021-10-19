import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:uenr_estate/helpers/apis/api.dart';

class AllowanceController extends GetxController {
  var allowances = [].obs;
  int get noticesCount => allowances.length;
  @override
  void onInit() {
    super.onInit();
    fetchAllowances();
  }

  void fetchAllowances() async {
    await http
        .get(Api.allowances)
        .then((res) => {
              // ignore: avoid_print
              print(jsonDecode(utf8.decode(res.bodyBytes))),
              allowances.value = jsonDecode(utf8.decode(res.bodyBytes)),
            })
        .catchError((err) {});
  }

  void postAllowance({Function? success, Map<String, dynamic>? data}) async {
    await http
        .post(Api.allowances, body: data)
        .then((res) => {
              // ignore: avoid_print
              print('ALLOWANCE CONTROLLER'),
              // ignore: avoid_print
              print(res.statusCode),
              // ignore: avoid_print
              if (res.statusCode == 201)
                {
                  // ignore: avoid_print
                  print(jsonDecode(utf8.decode(res.bodyBytes))),
                  success!(),
                }
              else
                {
                  // ignore: avoid_print
                  print(jsonDecode(utf8.decode(res.bodyBytes))),
                }
            })
        .onError((error, stackTrace) => {
              // ignore: avoid_print
              print(error),
            });
  }
}
