import 'dart:async';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';

class DioFactory {
  final String _baseUrl;

  const DioFactory(this._baseUrl);

  Dio create() => Dio(_createBaseOptions());

  BaseOptions _createBaseOptions() => BaseOptions(
        // Request base url
        baseUrl: _baseUrl,

        // Timeout in milliseconds for receiving data
        receiveTimeout: Duration(milliseconds: 15000).inMilliseconds,

        // Timeout in milliseconds for sending data
        sendTimeout: Duration(milliseconds: 15000).inMilliseconds,

        // Timeout in milliseconds for opening url
        connectTimeout: Duration(milliseconds: 5000).inMilliseconds,
      );
}

abstract class AppEnvironment {
  // String.fromEnvironment을 통해 컴파일타임 환경변수로 설정한 값을 읽어온다.
  static const baseUrl = String.fromEnvironment('BASE_URL');
}

class UserRepository {
  // Generate Instance
  static final UserRepository _userRepository = UserRepository();
  // Get Instance of the class
  static UserRepository get userRepositoryInstance => _userRepository;
  // Open Dio
  static final Dio _dio = const DioFactory(AppEnvironment.baseUrl).create();

  Future signIn({required String id, required String password}) async {
    try {
      // Internet Connection check
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return "Internet Connection Invalid";
      }

      // request body
      final data = {"id": id, "password": password};

      // get
      print("Get");
      final response = await _dio.post('/auth/login', data: data);

      // test log
      print(response.statusCode);

      if (response.statusCode == 201) {
        // 로그인 성공시에 access token, refresh token 저장
        final box = await Hive.openBox('tokens');
        box.put('access_token', response.data['accessToken']);
        box.put('refresh_token', response.data['refreshToken']);
        print(response.data['accessToken']);

        //test log
        print("success");

        return "Success";
      } else {
        // 로그인 실패 - 아이디 또는 PW가 틀렸음을 안내
        print("fail");
        return "Wrong ID or PW";
      }
    } catch (e) {
      //test log
      print("error");

      // error handling
    }
  }
}
