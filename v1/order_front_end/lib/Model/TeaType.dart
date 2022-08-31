import 'package:flutter/material.dart';
import 'package:order_front_end/Controller/Controller.dart';
import 'package:order_front_end/Controller/GetController.dart';

import 'TeaName.dart';

class TeaTypeList extends StatelessWidget {
  List? list;
  TeaTypeList({this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: (50 / 16),
      children: List.generate(list!.length, (i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.grey,
            child: TextButton(
              onPressed: () {
                GetController().show();
              },
              child: Center(
                child: Text(
                  list?[i]['type_value'],
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ),
            ),
          ),
        );
      }),
    ));
  }
}
