import 'package:flutter/material.dart';
import 'package:order_front_end/Model/OrderButtonModel.dart';

import 'OrderButtonSide/OrderTeaAdjustList.dart';
import 'OrderButtonSide/OrderTeaButtonList.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _OrderButtonData = new OrderButtonModel();

    return Container(
        color: Colors.grey,
        child: Column(
          children: [
            Expanded(flex: 7, child: OrderTeaButtonList()),
            Expanded(
              flex: 3,
              child: FutureBuilder<List>(
                future: _OrderButtonData.getTeaAdjustData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return snapshot.hasData
                      ? OrderTeaAdjustList(
                          list: snapshot.data,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            )
          ],
        ));
  }
}
