import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/Controller/OrderButtonController.dart';

import '../../../Controller/OrderListController.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller
    final _OrderButtonController = OrderButtonController();
    final _OrderListController = OrderListController();
    final ScrollController _controllerOne = ScrollController();

    return Scrollbar(
      controller: _controllerOne,
      thumbVisibility: true,
      thickness: 8,
      radius: Radius.circular(10),
      child: Obx(
        () => GridView.count(
          controller: _controllerOne,
          crossAxisCount: 1,
          childAspectRatio: (3 / 1),
          children: List.generate(OrderButtonController.orderList.length, (i) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    OrderListController.currFocusItemIndex = i;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(15)),
                      //     border: Border.all(width: 2)),
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  OrderListController.currFocusItemIndex = i;
                                  _OrderListController.addOrderItemCount();
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 8.0),
                            child: IconButton(
                                onPressed: () {
                                  OrderListController.currFocusItemIndex = i;
                                  _OrderListController.deleteOrderItemCount();
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 35,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                              flex: 5,
                              child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        OrderButtonController.orderList[i]
                                                    ['order_item_value']
                                                .toString() +
                                            'x ',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        OrderButtonController.orderList[i]
                                                ['order_item_count']
                                            .toString(),
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_right_rounded,
                                        size: 30,
                                      ),
                                      Flexible(
                                        child: OrderButtonController
                                                        .orderList[i]
                                                    ['order_item_toppings'] ==
                                                ''
                                            ? Text(
                                                OrderButtonController
                                                            .orderList[i]
                                                        ['order_item_size'] +
                                                    '/' +
                                                    OrderButtonController
                                                            .orderList[i]
                                                        ['order_item_adjust'],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 18),
                                              )
                                            : Text(
                                                OrderButtonController
                                                            .orderList[i]
                                                        ['order_item_size'] +
                                                    '/' +
                                                    OrderButtonController
                                                            .orderList[i]
                                                        ['order_item_adjust'] +
                                                    '/' +
                                                    OrderButtonController
                                                            .orderList[i]
                                                        ['order_item_toppings'],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                      ),
                                    ],
                                  ))),
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    OrderListController.currFocusItemIndex = i;
                                    _OrderListController.removeOrderItem();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 35,
                                    color: Colors.black,
                                  )))
                        ],
                      ),
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
