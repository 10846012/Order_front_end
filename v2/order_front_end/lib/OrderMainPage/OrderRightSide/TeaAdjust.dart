import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/GetX_OrderSide.dart';

import '../OrderLeftSide/GetX_OrderList.dart';

class TeaAdjust extends StatelessWidget {
  List? list;
  TeaAdjust({this.list});

  @override
  Widget build(BuildContext context) {
    var OrderGet = OrderSideGetx();
    var OrderListGet = OrderListGetx();
    return GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 6,
      childAspectRatio: (2 / 1),
      children: List.generate(list!.length, (i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () {
                OrderListGet.createAdjust(i);
                OrderListGet.createAdjustString();
              },
              child: Center(
                child: Text(
                  list?[i]['adjust_value'],
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
