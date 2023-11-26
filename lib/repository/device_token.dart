import 'package:dio/dio.dart';
import 'package:inthon_frontend/repository/auth_header.dart';
//import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

Future uploadDeviceToken(token) async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/alram/device';

  try {
    final authHeaders = await getAuthHeader();
    if (token != null) {
      var response = await dio.post(
        url,
        data: {
          'deviceToken': token,
        },
        options: Options(headers: authHeaders),
      );
      if (response.statusCode == 201) {
        print("Response data: ${response.data}");
    }
    } else {
      throw Exception('Failed to load profiles');
    }
  } catch (e) {
    //throw Exception('Error occurred: $e');
    print('Request URL: $url');
    if (e is DioError) {
      print('DioError: ${e.response?.statusCode} ${e.response?.data}');
    } else {
      print('Error occurred: $e');
    }
    return "error";
  }
}
