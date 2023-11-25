import 'package:dio/dio.dart';
import 'dart:convert';
import './auth_header.dart';

Future<List<Map<String, String>>> fetchProfileData() async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/group/members';

  try {
    final authHeaders = await getAuthHeader();
    // Response response = await _dio.post('/private-post',
    //     data: data, options: Options(headers: authHeaders));
  
    var response = await dio.get(url, options: Options(headers: authHeaders));

    if (response.statusCode == 200) {
      print("Response data: ${response.data}");
      List<dynamic> data = jsonDecode(response.data);
      return data
          .map((item) => {
                'nickName': item['name'] as String,
                'statusText': item['introduction'] as String,
                'imagePath': item['profile_image'] as String,
              })
          .toList();
    } else {
      throw Exception('Failed to load profiles');
    }
  } catch (e) {
    print('Request URL: $url');
    if (e is DioError) {
      print('DioError: ${e.response?.statusCode} ${e.response?.data}');
    } else {
      print('Error occurred: $e');
    }
    rethrow;
  }
}