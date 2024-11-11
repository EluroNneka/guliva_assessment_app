import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  String? _email;
  String? _password;
  bool? _obscure = true;
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
    loading = true;
    update();

    final Map<String, dynamic> payload = {
      "email": _email,
      "password": _password,
    };

    Get.showSnackbar(GetSnackBar(message: 'Loading....'));
    final response =
        await http.post(Uri.parse(loginUrl), body: payload);

    debugPrint(payload.toString());
    debugPrint("The response: ${response.body}");
    loading = false;
    Get.closeCurrentSnackbar();
    update();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged In Successfully')));
    } else {
      Get.closeAllSnackbars();
      throw Exception('Failed to load');
    }
  }
}
