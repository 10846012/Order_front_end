import 'package:flutter/material.dart';

class TeaAdjustList extends StatelessWidget {
  List? list;
  TeaAdjustList({this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 6,
      childAspectRatio: (50 / 22),
      children: List.generate(list!.length, (i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.grey,
            child: TextButton(
              onPressed: () {},
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
    ));
  }
}
