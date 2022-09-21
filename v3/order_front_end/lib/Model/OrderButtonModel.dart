import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderButtonModel {
  Future<List> getTeaTypeData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readTypeList.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getTeaNameData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readTeaName.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getTeaAdjustData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readAdjust.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getTeaToppingsData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readToppings.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
