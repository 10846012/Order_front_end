import 'package:flutter/material.dart';

import '../../Controller/OrderButtonController.dart';
import 'OrderButton.dart';
import 'OrderList.dart';
import 'OrderListSide/OrderListDrawer.dart';

class OrderMainPage extends StatelessWidget {
  static GlobalKey<ScaffoldState> keys = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keys,
      drawer: OrderListDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 4, child: OrderList()),
            Expanded(flex: 6, child: OrderButton())
          ],
        ),
      ),
    );
  }
}
