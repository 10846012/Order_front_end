import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../Model/OrderButtonModel.dart';
import 'OrderListController.dart';

class OrderButtonController extends GetxController {
  //Model uses
  final _OrderButtonModel = OrderButtonModel();

  //Controller
  final _OrderListController = OrderListController();

  //getOrderButtonData

  getOrderButtonTeaTypeData() async {
    final _teaType = await _OrderButtonModel.getTeaTypeData();
    return _teaType;
  }

  getOrderButtonTeaNameData() async {
    final _teaName = await _OrderButtonModel.getTeaNameData();
    return _teaName;
  }

  getOrderButtonTeaAdjustData() async {
    final _teaAdjust = await _OrderButtonModel.getTeaAdjustData();
    return _teaAdjust;
  }

  getOrderButtonToppingsData() async {
    final _toppings = await _OrderButtonModel.getTeaToppingsData();
    return _toppings;
  }

  //Set initial data
  List sugarList = [];
  List iceList = [];
  setTeaAdjustData() async {
    final _teaAdjust = await getOrderButtonTeaAdjustData();
    for (int i = 0; i < _teaAdjust.length; i++) {
      if (int.parse(_teaAdjust[i]['adjust_id']) <= 6) {
        sugarList.add(_teaAdjust[i]['adjust_value']);
      } else if (int.parse(_teaAdjust[i]['adjust_id']) > 6 &&
          int.parse(_teaAdjust[i]['adjust_id']) <= 12) {
        iceList.add(_teaAdjust[i]['adjust_value']);
      }
    }
  }

  //OrderButton Function
  RxList currTeaNameList = [].obs;
  RxInt currTypeIndex = 0.obs;
  void setOrderButtonTeaName() async {
    final _teaType = await getOrderButtonTeaTypeData();
    final _teaName = await getOrderButtonTeaNameData();

    currTeaNameList.value = [];
    for (int i = 0; i < _teaName.length; i++) {
      if (_teaName[i]['type_id'] == _teaType[currTypeIndex.value]['type_id']) {
        currTeaNameList.add(_teaName[i]['name_value']);
      }
    }
  }

  static RxList orderList = [].obs;
  int currNameIndex = 0;
  addOrderItem() async {
    Map tempItem = {};
    tempItem['order_item_value'] = currTeaNameList[currNameIndex];
    tempItem['order_item_count'] = 1;

    final List _largeSizeOnlyList = await largeSizeDetector();
    final List _mediumSizeOnlyList = await mediumSizeDetector();
    if (_largeSizeOnlyList.contains(tempItem['order_item_value'])) {
      tempItem['order_item_size'] = 'L';
    } else if (_mediumSizeOnlyList.contains(tempItem['order_item_value'])) {
      tempItem['order_item_size'] = 'M';
    } else {
      tempItem['order_item_size'] = 'L';
    }

    tempItem['order_item_adjust'] = '正常/正常';
    tempItem['order_item_toppings'] = '';
    orderList.add(tempItem);
    _OrderListController.setOrderListPrice();
    OrderListController.orderListItemCount.value++;
    OrderListController.currFocusItemIndex =
        orderList.length - 1; //新增項目時，自動Focus最新的品項
  }

  addOrderItemAdjust(String tempAdjust) async {
    final _toppings = await getOrderButtonToppingsData();
    if (orderList.isNotEmpty) {
      if (sugarList.contains(tempAdjust)) {
        String tempSugarString = OrderButtonController
                .orderList[OrderListController.currFocusItemIndex]
            ['order_item_adjust'];
        List tempSugarList = tempSugarString.split('/');
        if (tempSugarList.first == tempAdjust) {
          tempSugarList.first = '正常';
        } else {
          tempSugarList.first = tempAdjust;
        }
        OrderButtonController.orderList[OrderListController.currFocusItemIndex]
                ['order_item_adjust'] =
            tempSugarList.first + '/' + tempSugarList.last;
      } else if (iceList.contains(tempAdjust)) {
        String tempIceString = OrderButtonController
                .orderList[OrderListController.currFocusItemIndex]
            ['order_item_adjust'];
        List tempIceList = tempIceString.split('/');
        if (tempIceList.last == tempAdjust) {
          tempIceList.last = '正常';
        } else {
          tempIceList.last = tempAdjust;
        }
        OrderButtonController.orderList[OrderListController.currFocusItemIndex]
            ['order_item_adjust'] = tempIceList.first + '/' + tempIceList.last;
      } else if (tempAdjust == '中杯') {
        final List _largeSizeOnlyList = await largeSizeDetector();
        final List _mediumSizeOnlyList = await mediumSizeDetector();
        if (_largeSizeOnlyList.contains(OrderButtonController
                .orderList[OrderListController.currFocusItemIndex]
            ['order_item_value'])) {
          OrderButtonController
                  .orderList[OrderListController.currFocusItemIndex]
              ['order_item_size'] = 'L';
        } else if (_mediumSizeOnlyList.contains(OrderButtonController
                .orderList[OrderListController.currFocusItemIndex]
            ['order_item_value'])) {
          OrderButtonController
                  .orderList[OrderListController.currFocusItemIndex]
              ['order_item_size'] = 'M';
        } else {
          if (OrderButtonController
                      .orderList[OrderListController.currFocusItemIndex]
                  ['order_item_size'] ==
              'L') {
            OrderButtonController
                    .orderList[OrderListController.currFocusItemIndex]
                ['order_item_size'] = 'M';
            _OrderListController.setOrderListPrice();
          } else {
            OrderButtonController
                    .orderList[OrderListController.currFocusItemIndex]
                ['order_item_size'] = 'L';
            _OrderListController.setOrderListPrice();
          }
        }
      } else {
        if (orderList[OrderListController.currFocusItemIndex]
                ['order_item_toppings'] ==
            '') {
          orderList[OrderListController.currFocusItemIndex]
              ['order_item_toppings'] = tempAdjust;

          for (int i = 0; i < _toppings.length; i++) {
            if (_toppings[i]['toppings_value'] == tempAdjust) {
              orderList[OrderListController.currFocusItemIndex]
                      ['order_item_price'] =
                  orderList[OrderListController.currFocusItemIndex]
                          ['order_item_price'] +
                      int.parse(_toppings[i]['toppings_price']);
            }
          }
        } else {
          List tempToppingsList =
              orderList[OrderListController.currFocusItemIndex]
                      ['order_item_toppings']
                  .split('/');
          String tempToppingsString = '';
          if (tempToppingsList.contains(tempAdjust)) {
            tempToppingsList.remove(tempAdjust);
            for (int i = 0; i < _toppings.length; i++) {
              if (_toppings[i]['toppings_value'] == tempAdjust) {
                orderList[OrderListController.currFocusItemIndex]
                        ['order_item_price'] =
                    orderList[OrderListController.currFocusItemIndex]
                            ['order_item_price'] -
                        int.parse(_toppings[i]['toppings_price']);
              }
            }
          } else {
            tempToppingsList.add(tempAdjust);
            for (int i = 0; i < _toppings.length; i++) {
              if (_toppings[i]['toppings_value'] == tempAdjust) {
                orderList[OrderListController.currFocusItemIndex]
                        ['order_item_price'] =
                    orderList[OrderListController.currFocusItemIndex]
                            ['order_item_price'] +
                        int.parse(_toppings[i]['toppings_price']);
              }
            }
          }
          if (tempToppingsList.isNotEmpty) {
            tempToppingsString = tempToppingsList.first;
            for (int i = 1; i < tempToppingsList.length; i++) {
              tempToppingsString += '/' + tempToppingsList[i];
            }
            orderList[OrderListController.currFocusItemIndex]
                ['order_item_toppings'] = tempToppingsString;
          } else {
            orderList[OrderListController.currFocusItemIndex]
                ['order_item_toppings'] = '';
          }
        }
      }
    }
    _OrderListController.getOrderListPrice();
    OrderButtonController.orderList.refresh();
  }

  List largeSizeOnly = [];
  largeSizeDetector() async {
    final _teaName = await getOrderButtonTeaNameData();
    for (int i = 0; i < _teaName.length; i++) {
      if (_teaName[i]['type_id'] == '1' || _teaName[i]['type_id'] == '2') {
        largeSizeOnly.add(_teaName[i]['name_value']);
      }
    }
    return largeSizeOnly;
  }

  List mediumSizeOnly = [];
  mediumSizeDetector() async {
    final _teaName = await getOrderButtonTeaNameData();
    for (int i = 0; i < _teaName.length; i++) {
      if (_teaName[i]['name_value'] == '蜜香樟芝紅茶') {
        mediumSizeOnly.add(_teaName[i]['name_value']);
      }
    }
    return mediumSizeOnly;
  }
}
