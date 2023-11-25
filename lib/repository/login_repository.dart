import 'package:dio/dio.dart';
import 'dart:convert';

Future<List<Map<String, String>>> login() async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/auth/login';

  try {
    var response = await dio.post(url);

    if (response.statusCode == 201) {
      print("Response data: ${response.data}");
      final box = await Hive.openBox('token');
      box.put('access_token', response.data['accessToken']);
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
    rethrow;
  }
}
