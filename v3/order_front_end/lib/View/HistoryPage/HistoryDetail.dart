import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/Controller/HistoryController.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller
    final _HistoryController = HistoryController();

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
                      child: HistoryController.currOrderDetail.isEmpty
                          ? Text('流水號', style: TextStyle(fontSize: 20))
                          : Text(
                              '流水號: ' +
                                  HistoryController.currOrderDetail[0]
                                      ['order_list_id'],
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: HistoryController.currOrderDetail.isEmpty
                          ? Text(
                              '品項: ',
                              style: TextStyle(fontSize: 20),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  HistoryController.currOrderDetail.length,
                                  (i) {
                                return Text(
                                    HistoryController.currOrderDetail[i]
                                            ['order_item_value'] +
                                        ' ' +
                                        HistoryController.currOrderDetail[i]
                                            ['order_item_sugar'] +
                                        ',' +
                                        HistoryController.currOrderDetail[i]
                                            ['order_item_ice'] +
                                        ' ' +
                                        HistoryController.currOrderDetail[i]
                                            ['order_item_toppings'] +
                                        ' ' +
                                        HistoryController.currOrderDetail[i]
                                            ['order_item_size'] +
                                        '/' +
                                        HistoryController.currOrderDetail[i]
                                            ['order_item_count'] +
                                        '杯 ' +
                                        '\$' +
                                        (int.parse(HistoryController
                                                        .currOrderDetail[i]
                                                    ['order_item_price']) *
                                                int.parse(HistoryController
                                                        .currOrderDetail[i]
                                                    ['order_item_count']))
                                            .toString(),
                                    style: TextStyle(fontSize: 20));
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: HistoryController.currOrderTotalPrice == 0
                          ? Text(
                              '總金額: ',
                              style: TextStyle(fontSize: 20),
                            )
                          : Text(
                              '總金額: ' +
                                  HistoryController.currOrderTotalPrice.value
                                      .toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HistoryController.currOrderTime == ''
                                ? Text(
                                    '訂單時間: ',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Text(
                                    '訂單時間: ' +
                                        HistoryController.currOrderTime.value,
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
