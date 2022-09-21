import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/OrderButtonController.dart';

class OrderTeaAdjustList extends StatelessWidget {
  List? list;
  OrderTeaAdjustList({this.list});

  @override
  Widget build(BuildContext context) {
    //Controller
    final _OrderButtonController = OrderButtonController();

    //initState
    _OrderButtonController.setTeaAdjustData();

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
                _OrderButtonController.addOrderItemAdjust(
                    list?[i]['adjust_value']);
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
