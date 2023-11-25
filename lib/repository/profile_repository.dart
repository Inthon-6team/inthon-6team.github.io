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
      List<dynamic> data = response.data;
      return data
          .map((item) => {
                'id': item['id'] as String,
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

/*
 귀정: 이거 return 값으로 수정된 게 돌아옴 ㅇㅇ,,,
 수정된 거 받아가지고, 그걸로 바로 화면에 띄워주면 될 듯
 (수정된거 보여주면 될 듯 ㅇㅇ)
*/
Future<Map<String, dynamic>> updateStatusText(text) async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/user';

  try {
    final authHeaders = await getAuthHeader();
    // Response response = await _dio.post('/private-post',
    //     data: data, options: Options(headers: authHeaders));

    var response = await dio.patch(
      url,
      data: {
        'introduction': text,
      },
      options: Options(headers: authHeaders)
    );

    if (response.statusCode == 200) {
      print("Response data: ${response.data}");
      Map<String, dynamic> data = response.data;
      return {
        'nickName': data['name'] as String,
        'statusText': data['introduction'] as String,
        'imagePath': data['profile_image'] as String,
      };
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

Future<Map<String, dynamic>> fetchMyProfile() async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/user';

  try {
    final authHeaders = await getAuthHeader();
    // Response response = await _dio.post('/private-post',
    //     data: data, options: Options(headers: authHeaders));

    var response = await dio.get(
      url,
      options: Options(headers: authHeaders)
    );

    if (response.statusCode == 200) {
      print("Response data: ${response.data}");
      Map<String, dynamic> data = response.data;
      return ({
        'id': data['id'] as String,
        'nickName': data['name'] as String,
        'statusText': data['introduction'] as String,
        'imagePath': data['profile_image'] as String,
      });
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

Future<Map<String, dynamic>> updateName(name) async {
  var dio = Dio();
  var url = 'https://hello-t2pqd7uv4q-uc.a.run.app/user';

  try {
    final authHeaders = await getAuthHeader();
    // Response response = await _dio.post('/private-post',
    //     data: data, options: Options(headers: authHeaders));

    var response = await dio.patch(
      url,
      data: {
        'name': name,
      },
      options: Options(headers: authHeaders)
    );

    if (response.statusCode == 200) {
      print("Response data: ${response.data}");
      Map<String, dynamic> data = response.data;
      return {
        'nickName': data['name'] as String,
        'statusText': data['introduction'] as String,
        'imagePath': data['profile_image'] as String,
      };
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
