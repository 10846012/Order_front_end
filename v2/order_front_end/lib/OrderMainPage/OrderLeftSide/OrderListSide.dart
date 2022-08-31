import 'package:flutter/material.dart';

import 'GetX_OrderList.dart';
import 'OrderListAppBar.dart';
import 'OrderList.dart';
import 'OrderListBottom.dart';

class OrderListSide extends StatelessWidget {
  const OrderListSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderListGet = OrderListGetx();
    OrderListGet.getOrderId();
    return Column(
      children: [
        Expanded(flex: 1, child: OrderListAppBar()),
        Expanded(flex: 6, child: OrderList()),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ),
        Expanded(flex: 3, child: OrderListBottom()),
      ],
    );
  }
}
