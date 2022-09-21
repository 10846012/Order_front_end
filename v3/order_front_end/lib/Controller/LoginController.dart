import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  String respondString = '';
  bool loginDetect = false;
  postLoginData(String ID, String PW) {
    Map Order = {'login_id': ID, 'login_pw': PW};
    sendLoginData(Order);
  }

  sendLoginData(Map Order) async {
    final response = await http.post(
      Uri.parse('http://localhost/databaseCRUD/login.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Order),
    );
    respondString = jsonDecode(response.body);
    if (respondString == 'Sign in suceesfully') {
      loginDetect = true;
    }
    // if (response.statusCode == 200) {
    //   respondString = jsonDecode(response.body);

    // } else {
    //   throw Exception('Failed to get response.');
    // }
  }
}
