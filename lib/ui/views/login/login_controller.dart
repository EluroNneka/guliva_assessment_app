import 'package:get/get.dart';

class LoginController extends GetxController{

  String? _email;
  String? _password;
  bool? _obscure;


  void setEmail(String val) {
    _email = val;
    update();
  }

  String? getEmail(){
    return _email;
  }

  void setPassword(String val) {
    _password = val;
    update();
  }

  String? getPassword(){
    return _password;
  }
  void setObscured() {
    _obscure = !_obscure!;
    update();
  }

  bool? getObscured(){
    return _obscure;
  }
}