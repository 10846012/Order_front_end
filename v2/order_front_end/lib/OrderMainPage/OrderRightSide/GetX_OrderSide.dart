import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderLeftSide/GetX_OrderList.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/TeaAdjust.dart';

class OrderSideGetx extends GetxController {
  RxInt currKey = 0.obs;
  List teaTypeData = [];
  List teaNameData = [];
  RxList currTeaTypeList = [].obs;
  List firstTeaTypeList = [];
  static List teaAdjustList = [];

  static List sugar = [];
  static List ice = [];
  List size = [];

  setFirstTeaTypeList(var a) {
    firstTeaTypeList = [];
    if (a != null) {
      for (int i = 0; i < a.length; i++) {
        if (a[i]['type_id'] == '1') {
          firstTeaTypeList.add(a[i]['name_value']);
        }
      }
    }
  }

  changeTeaType() {
    currTeaTypeList.value = [];
    for (int i = 0; i < teaNameData.length; i++) {
      if (teaNameData[i]['type_id'] == teaTypeData[currKey.value]['type_id']) {
        currTeaTypeList.add(teaNameData[i]['name_value']);
      }
    }
  }

  setTeaAdjust(var temp) {
    teaAdjustList = [];
    if (temp != null) {
      for (int i = 0; i < temp.length; i++) {
        teaAdjustList.add(temp[i]['adjust_value']);
      }
    }
  }

  setSafeLock() {
    if (teaAdjustList != null) {
      for (int i = 0; i < teaAdjustList.length; i++) {
        if (RegExp('糖').hasMatch(teaAdjustList[i])) {
          sugar.add(teaAdjustList[i]);
        }
        if (RegExp('冰').hasMatch(teaAdjustList[i]) ||
            RegExp('溫').hasMatch(teaAdjustList[i]) ||
            RegExp('熱').hasMatch(teaAdjustList[i])) {
          ice.add(teaAdjustList[i]);
        }
      }
      sugar = sugar.toSet().toList();
      ice = ice.toSet().toList();
    }
  }
}
