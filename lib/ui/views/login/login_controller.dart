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

  Future<http.Response> loginUser() async {
    final Map<String, String> header = {
      'content-Type': 'application/json',
    };

    Get.dialog(SizedBox(
      height: 20.h,
        width: 20.w,
        child: const CircularProgressIndicator()));
    final Map<String, dynamic> payload = {
      "email": _email,
      "password": _password,
    };


    final response = await http.post(Uri.parse(loginUrl), body: jsonEncode(payload));


    debugPrint("The response: ${response.body}");

    Get.close(1);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
