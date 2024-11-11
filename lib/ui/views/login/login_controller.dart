import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String? _email;
  String? _password;
  bool? _obscure;
  bool loading = false;


  String loginUrl = "${env['API']}/user/login";

  void setEmail(String val) {
    _email = val;
    update();
  }

  String? getEmail() {
    return _email;
  }

  void setPassword(String val) {
    _password = val;
    update();
  }

  String? getPassword() {
    return _password;
  }

  void setObscured() {
    _obscure = !_obscure!;
    update();
  }

  bool? getObscured() {
    return _obscure;
  }

  Future loginUser(BuildContext context) async {
    final Map<String, String> header = {
      'content-Type': 'application/json',
    };
    loading = true;
    update();


    final Map<String, dynamic> payload = {
      "email": _email,
      "password": _password,
    };

    final response = await http.post(Uri.parse(loginUrl), body: jsonEncode(payload));

    debugPrint("The response: ${response.body}");
    loading = false;
    update();
    if (response.statusCode == 200) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged In Successfully')));

    } else {
      throw Exception('Failed to load');
    }
  }
}
