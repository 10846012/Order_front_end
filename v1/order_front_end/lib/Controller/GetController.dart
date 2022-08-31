import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';

class GetController extends GetxController {
  List a = [].abs;
  var showList = [].abs;

  void show() {
    for (int i = 0; i < a!.length; i++) {
      if (Controller.type_id == a?[i]['type_id']) {
        showList.add(a?[i]['name_value']);
      }
    }
    print(showList);
  }
}
