import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderRightSide/getOrderSideData.dart';

import '../OrderMainPage/OrderLeftSide/GetX_OrderList.dart';
import 'GetX_HistoryPage.dart';

class HistoryLeft extends StatelessWidget {
  const HistoryLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var DataController = getOrderSideData();
    var HistoryGet = HistoryGetx();

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Center(
                        child: Text(
                      '時間',
                      style: TextStyle(fontSize: 20),
                    ))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      '號碼',
                      style: TextStyle(fontSize: 20),
                    ))),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      '類型',
                      style: TextStyle(fontSize: 20),
                    ))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      '金額',
                      style: TextStyle(fontSize: 20),
                    ))),
              ],
            )),
        Expanded(
          flex: 14,
          child: Container(
            color: Colors.white,
            child: FutureBuilder<List>(
              future: DataController.getHistoryList(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? SingleChildScrollView(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                            indent: MediaQuery.of(context).size.width * 0.025,
                            endIndent:
                                MediaQuery.of(context).size.width * 0.025,
                          ),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int i) {
                            HistoryGet.HistoryData = snapshot.data!;
                            return GestureDetector(
                              onTap: () {
                                HistoryGet.showHistory(i);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                          child: Text(
                                        snapshot.data?[i]['order_time'],
                                        style: TextStyle(fontSize: 20),
                                      )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Center(
                                          child: Text(
                                        snapshot.data?[i]['order_list_id'],
                                        style: TextStyle(fontSize: 20),
                                      )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Center(
                                          child: Text(
                                        snapshot.data?[i]['order_type'],
                                        style: TextStyle(fontSize: 20),
                                      )),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                          child: Text(
                                            snapshot.data?[i]
                                                ['order_list_price'],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
