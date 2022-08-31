import 'dart:ffi';

import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/TeaAdjust.dart';

import '../OrderRightSide/GetX_OrderSide.dart';
import '../OrderRightSide/getOrderSideData.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderListGetx extends GetxController {
  var getData = getOrderSideData();
  var OrderGet = OrderSideGetx();
  var DataController = getOrderSideData();

  static RxInt orderId = 0.obs;
  static RxList orderList = [].obs;
  static RxInt orderCount = 0.obs;
  static RxInt totalItem = 0.obs;
  static RxInt totalPrice = 0.obs;
  String tempOrderString = '';
  Map<String, dynamic> tempOrder = {};

  static List tempAdjustList = [];
  static RxInt currFocusOrder = 0.obs;
  RxString currAdjustString = ''.obs;
  static bool isCurrFocusChange = false;

  static List priceList = [];

  var tempSugar = '正常';
  var tempIce = '正常';
  var tempToppings = [];
  var tempSize = 'L';

  getOrderId() async {
    final data = await DataController.getHistoryList();
    orderId.value = int.parse(data.last['order_list_id']) + 1;
  }

  createOrder() {
    orderCount++;
    tempOrder['teaName'] = tempOrderString;
    tempOrder['itemCount'] = 1;
    tempOrder['teaAdjust'] = tempSize + '/' + tempSugar + '/' + tempIce;
    orderList.value.add(tempOrder);
    totalItem++;
    tempOrderString = '';
    tempOrder = {};
    currFocusOrder.value = orderList.length - 1;
    isCurrFocusChange = true;
    addTotalPrice();
  }

  addItemCount() {
    orderList[currFocusOrder.value]['itemCount']++;
    addTotalPrice();
    totalItem++;
    orderCount++;
    orderCount--;
  }

  minusItemCount() {
    if (orderList[currFocusOrder.value]['itemCount'] > 1) {
      orderList[currFocusOrder.value]['itemCount']--;
      minusTotalPrice();
      totalItem--;
    } else {
      deleteOrder(currFocusOrder.value);
    }
    orderCount++;
    orderCount--;
  }

  deleteOrder(int i) {
    if (orderList.isEmpty != true) {
      if (orderList[currFocusOrder.value]['itemCount'] > 1) {
        for (int i = 0; i < priceList.length; i++) {
          if (priceList[i]['name_value'] ==
              orderList[currFocusOrder.value]['teaName']) {
            var temp = int.parse(priceList[i]['price']) *
                orderList[currFocusOrder.value]['itemCount'];
            totalPrice = totalPrice - temp.toInt();
          }
        }
      } else {
        minusTotalPrice();
      }
      totalPrice = totalPrice;
      totalItem = totalItem - orderList[currFocusOrder.value]['itemCount'];
      orderList.removeAt(i);
      orderCount.value--;
      isCurrFocusChange = true;
    }
  }

  createAdjust(int i) {
    if (orderList.isNotEmpty) {
      if (isCurrFocusChange == true) {
        tempSugar = OrderListGetx.orderList[currFocusOrder.value]['teaAdjust']
                [2] +
            OrderListGetx.orderList[currFocusOrder.value]['teaAdjust'][3];
        tempIce = OrderListGetx.orderList[currFocusOrder.value]['teaAdjust']
                [5] +
            OrderListGetx.orderList[currFocusOrder.value]['teaAdjust'][6];
        tempToppings = [];
        isCurrFocusChange = false;
        adjust = '';
      }

      if (OrderSideGetx.sugar.contains(OrderSideGetx.teaAdjustList[i])) {
        tempSugar = OrderSideGetx.teaAdjustList[i];
      } else if (OrderSideGetx.ice.contains(OrderSideGetx.teaAdjustList[i])) {
        tempIce = OrderSideGetx.teaAdjustList[i];
      } else if (OrderSideGetx.teaAdjustList[i] == '中杯') {
        if (tempSize == 'M') {
          tempSize = 'L';
        } else {
          tempSize = 'M';
        }
      } else {}
    }
  }

  var adjust = '';
  createAdjustString() {
    if (orderList.isNotEmpty) {
      if (tempSugar == '') {
        if (tempIce != '') {
          adjust = tempSize + '/' + tempIce;
        }
      } else {
        if (tempIce == '') {
          adjust = tempSize + '/' + tempSugar;
        } else {
          adjust = tempSize + '/' + tempSugar + '/' + tempIce;
        }
      }
      orderList[currFocusOrder.value]['teaAdjust'] = adjust;
      print(orderList);
      orderCount++;
      orderCount--;
    }
  }

  addTotalPrice() {
    for (int i = 0; i < priceList.length; i++) {
      if (priceList[i]['name_value'] ==
          orderList[currFocusOrder.value]['teaName']) {
        totalPrice += int.parse(priceList[i]['price']);
      }
    }
  }

  minusTotalPrice() {
    for (int i = 0; i < priceList.length; i++) {
      if (priceList[i]['name_value'] ==
          orderList[currFocusOrder.value]['teaName']) {
        totalPrice -= int.parse(priceList[i]['price']);
      }
    }
  }

  getItemPrice() async {
    final itemsPrice = await DataController.getItemsPrice();
    if (itemsPrice.isNotEmpty) {
      priceList = itemsPrice;
    }
  }

  checkOut() {
    var Order = [];
    for (int i = 0; i < orderList.length; i++) {
      var tempAdjust = ['L', null, null];

      tempAdjust = orderList[i]['teaAdjust'].split('/');
      var order_item_size = tempAdjust[0];
      tempAdjust.removeAt(0);
      var order_item_adjust = '';
      if (tempAdjust.isNotEmpty) {
        for (int j = 0; j < tempAdjust.length; j++) {
          order_item_adjust += tempAdjust[j]!;
        }
      }
      Order.add({
        "order_item_value": orderList[i]['teaName'],
        "order_item_size": order_item_size,
        "order_item_adjust": order_item_adjust,
        "order_item_count": orderList[i]['itemCount']
      });
    }

    sendData(Order);
    totalPrice.value = 0;
    totalItem.value = 0;
  }

  sendData(var Order) {
    http.post(
      Uri.parse('http://localhost/databaseCRUD/create/create_order.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Order),
    );
  }
}
