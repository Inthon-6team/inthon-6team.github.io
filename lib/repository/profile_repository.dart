import 'package:dio/dio.dart';
import 'dart:convert';

Future<List<Map<String, String>>> fetchProfileData() async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/group/members';

  try {
    var response = await dio.get(url);

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
