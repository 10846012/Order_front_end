import 'package:flutter/material.dart';
import 'package:order_front_end/Controller/HistoryController.dart';
import 'package:order_front_end/Model/OrderHistoryModel.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Model
    final _HistoryModel = OrderHistoryModel();

    //Controller
    final _HistoryController = HistoryController();

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
              future: _HistoryModel.getHistoryListData(),
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
                            return GestureDetector(
                              onTap: () {
                                _HistoryController.getCurrOrderDetail(i);
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
