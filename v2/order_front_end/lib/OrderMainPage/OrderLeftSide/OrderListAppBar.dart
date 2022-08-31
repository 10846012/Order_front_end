import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderLeftSide/GetX_OrderList.dart';
import 'package:order_front_end/OrderMainPage/OrderMainPage.dart';

import '../../HistoryPages/GetX_HistoryPage.dart';
import '../../HistoryPages/HistoryPage.dart';
import 'OrderListDrawer.dart';

class OrderListAppBar extends StatelessWidget {
  const OrderListAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var HistoryGet = HistoryGetx();
    var OrderListGet = OrderListGetx();

    return Obx(
      () => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  OrderMainPage.keys.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  HistoryGet.showHistory(0);
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          content: HistoryPage(),
                          backgroundColor: Colors.blue,
                        );
                      }));
                },
                icon: Icon(
                  Icons.history,
                  size: 40,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  OrderListGetx.totalItem.value = 0;
                  OrderListGetx.orderCount.value = 0;
                  OrderListGetx.orderList.value = [];
                },
                icon: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.black,
                )),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              OrderListGetx.orderId.toString(),
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
