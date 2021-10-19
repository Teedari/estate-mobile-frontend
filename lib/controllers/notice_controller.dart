import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:uenr_estate/helpers/apis/api.dart';

class NoticeController extends GetxController {
  var noticesList = [].obs;
  int get noticesCount => noticesList.length;
  @override
  void onInit() {
    super.onInit();
    fetchNotices();
  }

  void fetchNotices() async {
    await http
        .get(Api.notices)
        .then((res) => {
              // ignore: avoid_print
              print(jsonDecode(utf8.decode(res.bodyBytes))),
              noticesList.value = jsonDecode(utf8.decode(res.bodyBytes)),
            })
        .catchError((err) {});
  }

  void postNotice({Function? success, Map<String, dynamic>? data}) async {
    await http
        .post(Api.notices, body: data)
        .then((res) => {
              // ignore: avoid_print
              print('NOTICE CONTROLLER'),
              if (res.statusCode == 201)
                {
                  // ignore: avoid_print
                  print(jsonDecode(utf8.decode(res.bodyBytes))),
                  success!(),
                }
            })
        .onError((error, stackTrace) => {
              // ignore: avoid_print
              print(error),
            });
  }

  void _addNotice(dynamic data) {
    // var newData = [...noticesList.value, data];
    // print(newData);
    noticesList.add(data);
  }
}
