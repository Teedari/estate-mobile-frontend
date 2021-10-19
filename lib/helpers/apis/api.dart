import 'dart:io';

class Api {
  static const String baseUrl = 'https://uenr-estate-api.herokuapp.com';
  static httpConfig({String? token}) {
    return {
      'headers': {HttpHeaders.authorizationHeader: 'token $token'}
    };
  }

  static Uri loginUrl = Uri.parse('$baseUrl/authentication/user/login');
  static Uri creatUserUrl = Uri.parse('$baseUrl/authentication/user/create');
  static Uri getUserUrl = creatUserUrl;

  static String rawLoginUrl = '$baseUrl/authentication/user/login';
  static String rawCreateUserUrl = '$baseUrl/authentication/user/create';

  static Uri allowances = Uri.parse('$baseUrl/api/v1/allowances');
  static Uri complaints = Uri.parse('$baseUrl/api/v1/complaints');
  static Uri notices = Uri.parse('$baseUrl/api/v1/notices');
}
