import 'package:flutter/material.dart';
import 'package:order_front_end/Controller/Controller.dart';
import 'package:order_front_end/Controller/GetController.dart';

import 'TeaType.dart';

class TeaName extends StatelessWidget {
  List? list;
  TeaName({this.list});

  @override
  Widget build(BuildContext context) {
    GetController().a = list!;

    return SingleChildScrollView(
        child: GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: (50 / 16),
      children: List.generate(
          GetController().showList.isEmpty == true
              ? list!.length
              : GetController().showList.length, (i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.grey,
            child: TextButton(
                onPressed: () {},
                child: Center(
                    child: GetController().showList.isEmpty == true
                        ? Text(list?[i]['name_value'],
                            style: TextStyle(color: Colors.black, fontSize: 25))
                        : Text(
                            GetController().showList[i],
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ))),
          ),
        );
      }),
    ));
  }
}
