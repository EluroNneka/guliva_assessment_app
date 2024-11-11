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
  bool? _obscure = true;
  bool loading = false;
  bool acceptTerms = false;

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


  void setObscured() {
    _obscure = !_obscure!;
    update();
  }

  bool? getObscured() {
    return _obscure;
  }

  void setFirstName(String val) {
    _firstName = val;
    update();
  }

  String? getFirstName() {
    return _firstName;
  }

  void setLastName(String val) {
    _lastName = val;
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
    debugPrint(_dob);
    update();
  }

  String? getDob() {
    return _dob;
  }

  void setAcceptTerms() {
    acceptTerms = !acceptTerms;
    update();
  }

  Future registerUser(BuildContext context) async {
    final Map<String, dynamic> payload = {
      "firstName": _firstName,
      "lastName": _lastName,
      "dob": _dob,
      "email": _email,
      "phoneNo": _phone,
      "password": _password,
      "withEmail": "0",
    };
    Get.showSnackbar(GetSnackBar(message: 'Loading....'));
    debugPrint(payload.toString());
    final response = await http.post(Uri.parse(registerUrl), body: payload);


    debugPrint("The response: ${response.body}");

    loading = false;
    Get.closeCurrentSnackbar();
    update();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User Registered Successfully')));
    } else {
      Get.closeAllSnackbars();
      throw Exception('Failed to load');
    }
  }
}
