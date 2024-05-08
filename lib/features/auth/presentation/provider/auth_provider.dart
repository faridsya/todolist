
import 'dart:developer' as logger show log;
import 'dart:io';


import 'package:flutter/foundation.dart';

import '../../../../core/config/dialog.dart';
import '../../../../core/config/global.dart';
import '../../../../core/util/data_formatter.dart';
import '../../service/api/auth_service_api.dart';



class AuthProvider with ChangeNotifier {
  final _apiService = AuthServiceApi();

  // Local variable
  bool _isLoading = true;
  bool _isResend = false;

  bool get isResend => _isResend;



  String? _username;
  String? _email;
  String? _password;


  // Getter and setter
  bool get isLoading => _isLoading;

  set isLoading(bool value) => _isLoading = _isLoading;


  String get username => _username ?? '';

  set username(String value) => _username = value;

  String get email => _email ?? '';

  set email(String value) => _email = value;



  String get password => _password ?? '';

  set password(String value) => _password = value;

  Future<bool> simpanRegistrasi() async {
    bool _hasil = false;

    try {
      final responseData = await _apiService.simpanRegistrasi(
          password: _password!, email: email, username: _username!);

      print("responseData ${responseData.toString()}");
      if (responseData["statusCode"]==2000) {
        _hasil = true;
        // final _securedStorage = FlutterSecureStorage();
        // Memunculkan Pesan Sukses
        if (responseData["message"] != "") {

        }
      } else {

      }
      return responseData["status"];
    }

    on Exception {

      return _hasil;
    } catch (error) {

      return _hasil;
    }
  }

  Future<Map<String, dynamic>> login() async {
    Map<String, dynamic> mapHasil = {
      'hasil': false,
      'message': gPesanEror
    };

    try {
      final responseData = await _apiService.login(
          email: _email!, password: _password!);


      if (responseData["status"]) {
        mapHasil["hasil"] = true;
        mapHasil['message'] = responseData['message'];
        //gUser = UserModel.fromJson(responseData['data']);

        if (kDebugMode) {
          //   logger.log(
          //    //   'OTP_PROVIDER LOGIN: UserModel >> ${gUser.email}, ${gUser.namaPelanggan}, ${gUser.idAlamat} | TOKEN JSWT >> ');
          // }
          // // todo Memunculkan Pesan Sukses

          notifyListeners();
        } else {

        }
        return mapHasil;
      }
    } on Exception catch (e) {

      if (kDebugMode) logger.log('Exception-Login: $e');
    } catch (e) {
      if (kDebugMode) logger.log('FatalException-Login: ${e.toString()}');

    }
    return mapHasil;
  }


    }

