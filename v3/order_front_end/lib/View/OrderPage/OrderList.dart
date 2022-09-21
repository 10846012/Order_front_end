import 'package:flutter/material.dart';

import 'OrderListSide/OrderListAppBar.dart';
import 'OrderListSide/OrderListBottom.dart';
import 'OrderListSide/OrderListItem.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: OrderListAppBar()),
        Expanded(flex: 6, child: OrderListItem()),
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
