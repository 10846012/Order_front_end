import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/OrderHistoryModel.dart';
import '../Model/OrderPriceModel.dart';
import 'OrderButtonController.dart';

class OrderListController extends GetxController {
  //Model
  final _OrderListModel = OrderHistoryModel();
  final _OrderPriceModel = OrderPriceModel();

  //Controller

  //variable
  static int currFocusItemIndex = 0; //紀錄當下修改的品項
  static RxInt orderListItemCount = 0.obs;

  //getData

  getHistoryListData() async {
    final _listId = await _OrderListModel.getHistoryListData();
    return _listId;
  }

  getSizeData() async {
    final _size = await _OrderPriceModel.getSizeData();
    return _size;
  }

  //OrderList Function
  addOrderItemCount() {
    OrderButtonController.orderList[currFocusItemIndex]['order_item_count']++;
    getOrderListItemCount();
    getOrderListPrice();
    OrderButtonController.orderList.refresh();
  }

  deleteOrderItemCount() {
    if (OrderButtonController.orderList[currFocusItemIndex]
            ['order_item_count'] !=
        1) {
      OrderButtonController.orderList[currFocusItemIndex]['order_item_count']--;
      getOrderListItemCount();
      getOrderListPrice();
      OrderButtonController.orderList.refresh();
    } else {
      OrderButtonController.orderList[currFocusItemIndex]['order_item_count']--;
      removeOrderItem();
    }
  }

  removeOrderItem() {
    OrderButtonController.orderList.removeAt(currFocusItemIndex);
    getOrderListItemCount();
    getOrderListPrice();
    OrderButtonController.orderList.refresh();
  }

  removeAllOrderItem() {
    OrderButtonController.orderList.value = [];
    getOrderListItemCount();
    getOrderListPrice();
    OrderButtonController.orderList.refresh();
  }

  getOrderListItemCount() {
    if (OrderButtonController.orderList.isNotEmpty) {
      int tempCount = 0;
      for (int i = 0; i < OrderButtonController.orderList.length; i++) {
        tempCount = tempCount +
            OrderButtonController.orderList[i]['order_item_count'] as int;
      }
      orderListItemCount.value = tempCount;
    } else {
      orderListItemCount.value = 0;
    }
  }

  static RxInt listId = 1.obs;
  setOrderListId() async {
    final _listId = await getHistoryListData();
    List temp = _listId;
    if (temp.isNotEmpty) {
      listId.value = int.parse(temp.last['order_list_id']) + 1;
    }
    listId.refresh();
  }

  setOrderListPrice() async {
    final _sizeData = await getSizeData();
    for (int i = 0; i < _sizeData.length; i++) {
      if (OrderButtonController
                      .orderList[OrderListController.currFocusItemIndex]
                  ['order_item_value'] ==
              _sizeData[i]['name_value'] &&
          OrderButtonController
                      .orderList[OrderListController.currFocusItemIndex]
                  ['order_item_size'] ==
              _sizeData[i]['size_value']) {
        OrderButtonController.orderList[OrderListController.currFocusItemIndex]
            ['order_item_price'] = int.parse(_sizeData[i]['price']);
      }
    }
    getOrderListPrice();
  }

  static RxInt listTotalPrice = 0.obs;
  getOrderListPrice() {
    listTotalPrice.value = 0;
    for (int i = 0; i < OrderButtonController.orderList.length; i++) {
      int tempPrice = 0;
      tempPrice = OrderButtonController.orderList[i]['order_item_count'] *
          OrderButtonController.orderList[i]['order_item_price'];
      listTotalPrice += tempPrice;
    }
  }

  sendData() {
    List Order = [];
    for (int i = 0; i < OrderButtonController.orderList.length; i++) {
      List temp =
          OrderButtonController.orderList[i]['order_item_adjust'].split('/');
      String tempSugar = temp.first;
      String tempIce = temp.last;
      Order.add({
        "order_item_value": OrderButtonController.orderList[i]
            ['order_item_value'],
        "order_item_count": OrderButtonController.orderList[i]
            ['order_item_count'],
        "order_item_size": OrderButtonController.orderList[i]
            ['order_item_size'],
        "order_item_sugar": tempSugar,
        "order_item_ice": tempIce,
        "order_item_toppings": OrderButtonController.orderList[i]
            ['order_item_toppings'],
        "order_item_price": OrderButtonController.orderList[i]
            ['order_item_price'],
      });
    }
    Order.add(listId.value);
    Order.add(listTotalPrice.value);
    http.post(
      Uri.parse('http://localhost/databaseCRUD/create/create_order.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(Order),
    );

    listId++;
    orderListItemCount.value = 0;
    listTotalPrice.value = 0;
    OrderButtonController.orderList.value = [];
  }
}
