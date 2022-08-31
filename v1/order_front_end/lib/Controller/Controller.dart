import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../Model/TeaName.dart';

class Controller {
  static var type_id = '1';
  Future<List> getTeaTypeData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readTypeList.php');
    final response = await http.get(url);
    var a = json.decode(response.body);
    return a;
  }

  Future<List> getTeaNameData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readTeaName.php');
    final response = await http.get(url);
    var a = json.decode(response.body);
    return a;
  }

  // static var type_id;
  // Future<List> changeType() async {
  //   type_id = '2';
  //   var url = Uri.parse('http://localhost/databaseCRUD/read/readTeaName.php');
  //   http.post(url, body: {
  //     'type_id': type_id,
  //   });
  //   url = Uri.parse('http://localhost/databaseCRUD/read/readTeaName.php');
  //   final response = await http.get(url);
  //   return json.decode(response.body);
  // }

  Future<List> getAdjustData() async {
    var url = Uri.parse('http://localhost/databaseCRUD/read/readAdjust.php');
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static bool addItem = false;
  static List OrderMap = [];
  static var index = 0;
  createItem() {
    List temp = [];
    var value = '烏龍';
    var size = 'M';
    var adjust = '微糖少冰';
    var price = 20;
    if (addItem) {
      temp.add({
        'order_value': value,
        'order_size': size,
        'order_adjust': adjust,
        'order_price': price
      });
      OrderMap.addAll(temp);
      index++;
      addItem = false;
    }

    print(jsonEncode(OrderMap));
  }

  createOrder() {
    var url =
        Uri.parse('http://localhost/databaseCRUD/create/create_order.php');
    http.post(url, body: jsonEncode(OrderMap));
  }

  updateOrder() {
    var id = '5';
    var value = '紅茶';
    var size = 'M';
    var adjust = '無糖多冰';
    var price = '120';

    var url = Uri.parse('http://localhost/databaseCRUD/update/update.php');
    http.post(url, body: {
      'order_id': id,
      'order_value': value,
      'order_size': size,
      'order_adjust': adjust,
      'order_price': price,
    });
  }

  deleteOrder() {
    var id = '4';

    var url = Uri.parse('http://localhost/databaseCRUD/delete/delete.php');
    http.post(url, body: {
      'order_id': id,
    });
  }
}
