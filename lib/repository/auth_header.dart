Future getAuthHeader() async {
    Box _tokenBox = await Hive.openBox('token');
    var accessToken = _tokenBox.get('access_token');

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    };

    return headers;
}