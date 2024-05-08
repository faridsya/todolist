import 'dart:developer' as logger;

import 'package:flutter/foundation.dart';

import '../../../../core/config/app_url.dart';
import '../../../../core/config/dialog.dart';
import '../../../../core/config/global.dart';
import '../../../../core/helper/api_helper.dart';


/// [AuthServiceApi] merupakan service class penghubung provider dengan request api.
class AuthServiceApi {
  final _apiHelper = ApiHelper();

  /// [sendOTP] service untuk request pengiriman OTP kepada user.


  Future<Map<String, dynamic>> login({
    required String email,
    required String password,

  }) async {
    if (kDebugMode) {
      logger.log('AUTH_SERVICE_API-Login: parameter >> $email $password');
    }
    print("tess");
    final response = await _apiHelper.requestPost(
      jwt: false,
      url: AppUrl.login,
      bodyParams: {
        'email': email,
        'password': password,

      },
    );

    if (kDebugMode) {
      logger.log('AUTH_SERVICE_API-Login: response >> $response');
    }
    return response;
  }

  Future<Map<String, dynamic>> simpanRegistrasi({
    required String password,
    required String username,
    required String email,

  }) async {
    // if (kDebugMode) {
    //   logger.log("AUTH_SERVICE_API-SimpanRegistrasi: IMEIi >> $imei-$nama-$email-$nohp");
    // }


    final response = await _apiHelper.requestPost(

      url: AppUrl.registrasi,
      bodyParams: {
        'username': username,
        'password': password,
        'email': email,


      },
    );
    if (kDebugMode) {
      logger.log('AUTH_SERVICE_API-SimpanRegistrasi: response >> $response');
    }
    return response;
  }


  }


