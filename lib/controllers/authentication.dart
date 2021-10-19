import 'package:uenr_estate/helpers/local_data/shared_helper.dart';

class Authentication {
  // Authentication() {
  //   setUserLoggedIn();
  // }
  static String username = '';
  static userHasLoggedIn() async {
    var res = await LocalData.getLocalData('token');
    username = await LocalData.getLocalData('username');
    return res != '' ? true : false;
  }

  static userLoggedIn() {
    return userHasLoggedIn();
  }

  static userLogout() async {
    await LocalData.removeLocalData('token');
  }
}
