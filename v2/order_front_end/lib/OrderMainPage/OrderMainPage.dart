import 'package:flutter/material.dart';
import 'package:order_front_end/OrderMainPage/OrderLeftSide/OrderListSide.dart';

import 'OrderLeftSide/GetX_OrderList.dart';
import 'OrderLeftSide/OrderListDrawer.dart';
import 'OrderRightSide/OrderSide.dart';

class OrderMainPage extends StatelessWidget {
  static GlobalKey<ScaffoldState> keys = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var OrderListGet = OrderListGetx();
    OrderListGet.getItemPrice();

    return Scaffold(
      key: keys,
      drawer: OrderListDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 4, child: OrderListSide()),
            Expanded(flex: 6, child: OrderSide()),
          ],
        ),
      ),
    );
  }
}
