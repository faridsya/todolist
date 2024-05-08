import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String baseURL = dotenv.env['BASE_URL']!;

  static String registrasi = baseURL + "register";
  static String login = baseURL + "login";

}
