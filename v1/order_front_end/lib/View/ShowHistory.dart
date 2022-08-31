import 'package:flutter/material.dart';

class ShowHistory extends StatelessWidget {
  const ShowHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.height * 1.3,
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                //左邊列表
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Center(
                                    child: DefaultTextStyle(
                                        style: TextStyle(fontSize: 20),
                                        child: Text('時間'))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                    child: DefaultTextStyle(
                                        style: TextStyle(fontSize: 20),
                                        child: Text('號碼'))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                    child: DefaultTextStyle(
                                        style: TextStyle(fontSize: 20),
                                        child: Text('類型'))),
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                    child: DefaultTextStyle(
                                        style: TextStyle(fontSize: 20),
                                        child: Text('金額'))),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: SingleChildScrollView(
                              physics: ScrollPhysics(),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Center(
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                        child: Text('時間'))),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                        child: Text('號碼'))),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                        child: Text('類型'))),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Center(
                                                    child: DefaultTextStyle(
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                        child: Text('金額'))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              //右上資訊欄
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, bottom: 15, right: 30),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('流水號：')),
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('0')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('品項名稱  ')),
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('品項調整')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('總金額  ')),
                                DefaultTextStyle(
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    child: Text('0')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('訂單時間：')),
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('日期')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('取貨時間：')),
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('日期')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('取貨方式：')),
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('自取')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('付款方式：')),
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                        child: Text('現金')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: 150,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '補印貼紙',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.04,
                    width: 150,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '補印收據',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 30, bottom: 30),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              '關閉',
                              style: TextStyle(fontSize: 30,color: Colors.white),
                            ))),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
