import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/GetX_OrderSide.dart';

import 'GetX_OrderList.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderListGet = OrderListGetx();
    var OrderGet = OrderSideGetx();
    final ScrollController _controllerOne = ScrollController();

    return
        // SingleChildScrollView(
        //   child:

        Obx(
      () => Scrollbar(
        controller: _controllerOne,
        thumbVisibility: true,
        thickness: 8,
        radius: Radius.circular(10),
        child: GridView.count(
          controller: _controllerOne,
          crossAxisCount: 1,
          childAspectRatio: (3 / 1),
          children: List.generate(OrderListGetx.orderCount.value, (i) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    OrderListGetx.currFocusOrder.value = i;
                    OrderListGetx.isCurrFocusChange = true;
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
                                  OrderListGetx.currFocusOrder.value = i;
                                  OrderListGet.addItemCount();
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 8.0),
                            child: IconButton(
                                onPressed: () {
                                  OrderListGetx.currFocusOrder.value = i;
                                  OrderListGet.minusItemCount();
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 40,
                                  color: Colors.black,
                                )),
                          ),
                          Expanded(
                              flex: 5,
                              child: ListTile(
                                  title: Row(
                                    children: [
                                      Text(
                                        OrderListGetx.orderList[i]['teaName'] +
                                            ' x',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Flexible(
                                          child: Text(
                                        OrderListGetx.orderList[i]['itemCount']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 30),
                                      ))
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_right_rounded,
                                        size: 30,
                                      ),
                                      Flexible(
                                        child: Text(
                                          OrderListGetx.orderList[i]
                                                      ['teaAdjust'] ==
                                                  null
                                              ? ''
                                              : OrderListGetx.orderList[i]
                                                      ['teaAdjust']
                                                  .toString(),
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
                                    OrderListGetx.currFocusOrder.value = i;
                                    OrderListGet.deleteOrder(i);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 40,
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
