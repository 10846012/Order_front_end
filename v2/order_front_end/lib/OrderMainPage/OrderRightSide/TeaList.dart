import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/GetX_OrderSide.dart';
import '../OrderLeftSide/GetX_OrderList.dart';
import 'getOrderSideData.dart';

class TeaList extends StatelessWidget {
  const TeaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderGet = new OrderSideGetx();
    var OrderListGet = new OrderListGetx();
    var DataController = new getOrderSideData();

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
            future: DataController.getTeaTypeData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              var TeaTypeData = snapshot.data;
              return snapshot.hasData
                  ? SingleChildScrollView(
                      child: GridView.count(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: (1.5 / 0.6),
                        children: List.generate(TeaTypeData!.length, (i) {
                          OrderGet.teaTypeData = TeaTypeData;
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              color: colors[i],
                              child: TextButton(
                                onPressed: () {
                                  OrderGet.currKey.value = i;

                                  OrderGet.changeTeaType();
                                },
                                child: Center(
                                  child: Text(
                                    TeaTypeData[i]['type_value'],
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
            future: DataController.getTeaNameData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              var TeaNameData = snapshot.data;
              OrderGet.setFirstTeaTypeList(TeaNameData);
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
                                OrderGet.currTeaTypeList.isNotEmpty
                                    ? OrderGet.currTeaTypeList.length
                                    : OrderGet.firstTeaTypeList.length, (i) {
                              OrderGet.teaNameData = TeaNameData!;
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  color: Color.fromARGB(255, 157, 199, 233),
                                  child: TextButton(
                                    onPressed: () {
                                      if (OrderGet.currTeaTypeList.isEmpty ==
                                          true) {
                                        OrderListGet.tempOrderString =
                                            OrderGet.firstTeaTypeList[i];
                                        OrderListGet.createOrder();
                                      } else {
                                        OrderListGet.tempOrderString =
                                            OrderGet.currTeaTypeList[i];
                                        OrderListGet.createOrder();
                                      }
                                    },
                                    child: Center(
                                      child: OrderGet.currTeaTypeList.isEmpty
                                          ? Text(
                                              OrderGet.firstTeaTypeList[i],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25),
                                            )
                                          : Text(
                                              OrderGet.currTeaTypeList[i],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25),
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
