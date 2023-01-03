import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.100.101.64:8000/api';

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      var url = '$baseUrl/register';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';

        return user;
      } else {
        throw Exception('Gagal Register');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    try {
      var url = '$baseUrl/login';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'email': email,
        'password': password,
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';

        return user;
      } else {
        throw Exception('Gagal Login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
