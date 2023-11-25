import 'package:dio/dio.dart';
//import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

Future<String> login(id, password) async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/auth/login';

  try {
    var response = await dio.post(
      url,
      data: {
        'id': id,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      print("Response data: ${response.data}");

      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('access_token', response.data['accessToken']);
      return response.data['accessToken'];
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
