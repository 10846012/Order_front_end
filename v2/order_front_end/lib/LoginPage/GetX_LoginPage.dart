import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginPageGetx extends GetxController {
  String loginID = '';
  String loginPW = '';
  String respondString = '';
  bool loginDetect = false;

  postLoginData(String ID, String PW) {
    loginID = ID;
    loginPW = PW;

    var Order = {'login_id': loginID, 'login_pw': loginPW};
    sendLoginData(Order);
  }

  sendLoginData(var Order) async {
    final response = await http.post(
      Uri.parse('http://localhost/databaseCRUD/login.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Order),
    );
    if (response.statusCode == 200) {
      respondString = jsonDecode(response.body);
      if (respondString == 'Sign in suceesfully') {
        loginDetect = true;
      }
    } else {
      throw Exception('Failed to get response.');
    }
  }
}
