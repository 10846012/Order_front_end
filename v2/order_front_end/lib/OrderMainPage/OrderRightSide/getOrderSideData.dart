import 'dart:convert';
import 'package:http/http.dart' as http;

import '../OrderLeftSide/GetX_OrderList.dart';

class getOrderSideData {
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

  Future<List> getAdjustData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readAdjust.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getHistoryList() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readHistory.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getHistoryItems() async {
    var url =
        Uri.parse('http://localhost/databaseCRUD/read/readHistoryItems.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List> getItemsPrice() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readSize.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }
}
