import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderHistoryModel {
  Future<List> getHistoryListData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readHistory.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getHistoryDetailData() async {
    var url =
        Uri.parse('http://localhost/databaseCRUD/read/readHistoryItems.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
