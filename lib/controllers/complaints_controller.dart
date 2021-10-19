import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:uenr_estate/helpers/apis/api.dart';

class ComplaintsController extends GetxController {
  var complaints = [].obs;
  int get noticesCount => complaints.length;
  @override
  void onInit() {
    super.onInit();
    fetchComplaints();
  }

  void fetchComplaints() async {
    await http
        .get(Api.complaints)
        .then((res) => {
              // ignore: avoid_print
              print(jsonDecode(utf8.decode(res.bodyBytes))),
              complaints.value = jsonDecode(utf8.decode(res.bodyBytes)),
            })
        .catchError((err) {});
  }

  void postComplain({Function? success, Map<String, dynamic>? data}) async {
    await http
        .post(Api.complaints, body: data)
        .then((res) => {
              // ignore: avoid_print
              print('COMPLAINT CONTROLLER'),
              print(res.statusCode),
              // ignore: avoid_print
              if (res.statusCode == 201)
                {
                  print(jsonDecode(utf8.decode(res.bodyBytes))),
                  success!(),
                }
            })
        .onError((error, stackTrace) => {
              // ignore: avoid_print
              print(error),
            });
  }
}
