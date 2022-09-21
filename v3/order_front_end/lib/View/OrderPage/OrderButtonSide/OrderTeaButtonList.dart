import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/Controller/OrderButtonController.dart';
import 'package:order_front_end/Controller/OrderListController.dart';
import '../../../Model/OrderButtonModel.dart';

class OrderTeaButtonList extends StatelessWidget {
  const OrderTeaButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Model uses
    final _OrderButtonModel = OrderButtonModel();

    //Controller
    final _OrderButtonController = OrderButtonController();

    //initState
    _OrderButtonController.setOrderButtonTeaName();

    List<Color> colors = [
      Colors.green,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.red,
      Colors.white,
      Colors.yellow,
      Colors.yellow,
      Colors.pink,
      Colors.white,
      Colors.white,
      Colors.white
    ];

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: FutureBuilder<List>(
            future: _OrderButtonModel.getTeaTypeData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? SingleChildScrollView(
                      child: GridView.count(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: (1.5 / 0.6),
                        children: List.generate(snapshot.data!.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              color: colors[i],
                              child: TextButton(
                                onPressed: () {
                                  _OrderButtonController.currTypeIndex.value =
                                      i;
                                  _OrderButtonController
                                      .setOrderButtonTeaName();
                                },
                                child: Center(
                                  child: Text(
                                    snapshot.data?[i]['type_value'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: FutureBuilder<List>(
            future: _OrderButtonModel.getTeaNameData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }

              return snapshot.hasData
                  ? Obx(
                      () => SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GridView.count(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            childAspectRatio: (1.5 / 0.6),
                            children: List.generate(
                                _OrderButtonController.currTeaNameList.isEmpty
                                    ? 0
                                    : _OrderButtonController
                                        .currTeaNameList.length, (i) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  color: Color.fromARGB(255, 157, 199, 233),
                                  child: TextButton(
                                    onPressed: () {
                                      _OrderButtonController.currNameIndex = i;
                                      _OrderButtonController.addOrderItem();
                                    },
                                    child: Center(
                                      child: Text(
                                        _OrderButtonController
                                            .currTeaNameList[i],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ],
    );
  }
}
