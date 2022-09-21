import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderPriceModel {
  Future<List> getSizeData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readSize.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
