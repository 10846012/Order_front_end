import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderLeftSide/GetX_OrderList.dart';

class OrderListBottom extends StatelessWidget {
  const OrderListBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderListGet = OrderListGetx();

    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  '杯數 ' + OrderListGetx.totalItem.value.toString(),
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
                  '金額 ' + OrderListGetx.totalPrice.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          Expanded(
              child: OrderListGetx.orderList.isEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromARGB(255, 199, 199, 199),
                      child: Center(
                        child: Text(
                          '結帳',
                          style: TextStyle(fontSize: 80, color: Colors.black),
                        ),
                      ))
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {
                            if (OrderListGetx.orderCount != 0) {
                              OrderListGet.checkOut();
                              OrderListGetx.orderCount.value = 0;
                              OrderListGetx.orderList.value = [];
                              OrderListGetx.orderId++;
                            }
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
