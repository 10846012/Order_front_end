import 'package:flutter/material.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/TeaAdjust.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/TeaList.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/GetX_OrderSide.dart';
import 'getOrderSideData.dart';

class OrderSide extends StatelessWidget {
  const OrderSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderGet = OrderSideGetx();
    var DataController = new getOrderSideData();

    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Expanded(flex: 7, child: TeaList()),
          Expanded(
            flex: 3,
            child: FutureBuilder<List>(
              future: DataController.getAdjustData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                var temp = snapshot.data;
                OrderGet.setTeaAdjust(temp);
                OrderGet.setSafeLock();
                return snapshot.hasData
                    ? TeaAdjust(
                        list: snapshot.data,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
