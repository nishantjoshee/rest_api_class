import 'dart:convert';

import 'package:rest_api_class/data/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getData() async {
    const usersUrl = "https://reqres.in/api/users";
    try {
      final response = await http.get(Uri.parse(usersUrl));
      final responseData = json.decode(response.body);
      final userList = responseData['data'] as List;

      // final List<UserModel> users = [];
      // for (var data in userList) {
      //   UserModel user = UserModel.fromJson(data);
      //   users.add(user);
      // }
      // return users;

      return userList.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
