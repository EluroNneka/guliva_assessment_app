import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _dob;

  bool loading = false;

  String registerUrl = "${env['API']}/user/register";

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

  void setFirstName(String val) {
    _firstName = val;
    update();
  }

  String? getFirstName() {
    return _firstName;
  }

  void setLastName(String val) {
    _password = val;
    update();
  }

  String? getLastName() {
    return _lastName;
  }

  void setPhone(String val) {
    _phone = val;
    update();
  }

  String? getPhone() {
    return _phone;
  }

  void setDob(String val) {
    _dob = val;
    update();
  }

  String? getDob() {
    return _dob;
  }

  Future<http.Response> registerUser() async {
    final Map<String, String> header = {
      'content-Type': 'application/json',
    };

    final Map<String, dynamic> payload = {
      "firstName": _firstName,
      "lastName": _lastName,
      "dob": _dob,
      "email": _email,
      "phoneNo": _phone,
      "password": _password,
      "withEmail": true,
    };

    loading = true;
    final response = await http.post(Uri.parse(registerUrl), body: payload);

    debugPrint("The response: ${response.body}");

    loading = false;
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to load');
    }
  }
}
