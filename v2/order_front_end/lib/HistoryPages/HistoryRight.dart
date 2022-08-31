import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/OrderMainPage/OrderLeftSide/GetX_OrderList.dart';

import 'GetX_HistoryPage.dart';

class HistoryRight extends StatelessWidget {
  const HistoryRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var HistoryGet = HistoryGetx();
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 9,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '流水號: ' + HistoryGetx.currHistoryId.value,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: HistoryGetx.showHistoryOrder.isEmpty
                          ? Text(
                              '品項: ',
                              style: TextStyle(fontSize: 20),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  HistoryGetx.showHistoryOrder.length, (i) {
                                return Text(
                                  HistoryGetx.showHistoryOrder[i]
                                          ['order_item_value'] +
                                      '  -  ' +
                                      HistoryGetx.showHistoryOrder[i]
                                          ['order_item_adjust'] +
                                      '  /  ' +
                                      HistoryGetx.showHistoryOrder[i]
                                          ['order_item_size'] +
                                      '  /  ' +
                                      HistoryGetx.showHistoryOrder[i]
                                          ['order_item_count'] +
                                      '杯  ' +
                                      '\$' +
                                      HistoryGetx.showHistoryOrder[i]
                                              ['order_item_price']
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                );
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '總金額: ' + HistoryGetx.currHistoryPrice.value,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '訂單時間: ' + HistoryGetx.currHistoryTime.value,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '取貨時間: ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '取貨方式: ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '付款方式: ',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 9.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '補印貼紙',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '補印收據',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '關閉',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
