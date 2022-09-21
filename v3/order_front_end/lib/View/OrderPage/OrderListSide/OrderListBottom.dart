import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/Controller/OrderButtonController.dart';

import '../../../Controller/OrderListController.dart';

class OrderListBottom extends StatelessWidget {
  const OrderListBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller
    final _OrderListController = OrderListController();

    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  '杯數 ' +
                      OrderListController.orderListItemCount.value.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Text(
                  '金額 ' + OrderListController.listTotalPrice.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  _OrderListController.sendData();
                },
                child: Text(
                  '結帳',
                  style: TextStyle(fontSize: 80, color: Colors.black),
                )),
          ))
        ],
      ),
    );
  }
}
