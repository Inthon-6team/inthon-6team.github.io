import 'package:shared_preferences/shared_preferences.dart';

Future getAuthHeader() async {
  final preferences = await SharedPreferences.getInstance();
  var accessToken = preferences.getString('access_token');

  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $accessToken"
  };

  return headers;
}
