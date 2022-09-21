import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/HistoryController.dart';
import '../../../Controller/OrderListController.dart';
import '../../HistoryPage/HistoryPage.dart';
import '../OrderMainPage.dart';

class OrderListAppBar extends StatelessWidget {
  const OrderListAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller
    final _OrderListController = OrderListController();

    //initState
    _OrderListController.setOrderListId();

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
                  size: 35,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
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
                  size: 35,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  _OrderListController.removeAllOrderItem();
                },
                icon: Icon(
                  Icons.delete,
                  size: 35,
                  color: Colors.black,
                )),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15),
            child: Text(
              OrderListController.listId.value.toString(),
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
