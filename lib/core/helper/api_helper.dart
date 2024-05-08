import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/global.dart';





class ApiHelper {
  Future< Map<String, dynamic> > requestPost(

      {String url="", required Map<String, dynamic> bodyParams, bool jwt = false}) async {
    print("tes2");
    Map<String, dynamic>  result = {'status': false, 'body':null };



    Map<String, String> header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $vTokenJwt',
    };
    Map<String, dynamic> bodyToken = {
      'token': "dianterinYGfdsk3452355mj56uy",
    };
    final body = {
      ...bodyToken,
      ...?bodyParams,
    };

    try {
      print("responsebody ${url}");
      final response = await http.post(Uri.parse(url),
          headers: header, body: json.encode(body));


      if(response.statusCode==200)  {
      return json.decode(response.body.toString());
      }
    } on Exception {
      return result;
    } catch (error) {
      return result;
    }
    return  result;
  }




}
