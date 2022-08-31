import 'package:flutter/material.dart';

import '../Controller/Controller.dart';
import '../Model/TeaAdjust.dart';
import '../Model/TeaName.dart';
import '../Model/TeaType.dart';
import 'NavigationDrawer.dart';
import 'ShowHistory.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: Row(children: [
          Expanded(
            //左半部
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    //Bar
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(Icons.menu, size: 30)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => ShowHistory());
                              },
                              icon: Icon(
                                Icons.history,
                                size: 30,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, size: 30),
                            )),
                        Spacer(),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, right: 20),
                            child: Text(
                              '0',
                              style: TextStyle(fontSize: 30),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      //已點餐點
                      flex: 7,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.grey,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Controller().updateOrder();
                                        });
                                        print('update');
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 30,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3, bottom: 3),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          Controller().deleteOrder();
                                        });
                                        print('delete');
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 30,
                                      )),
                                ),
                                Expanded(
                                    flex: 6,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 7,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 9,
                                                    child: Container(
                                                      child: Center(
                                                          child: Text(
                                                        '品項名稱',
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: Colors.blue),
                                                      )),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: Icon(Icons.close,
                                                          size: 30),
                                                    )),
                                              ],
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Center(
                                                  child: Text(
                                                '品項調整',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue),
                                              )),
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ])),
                  Expanded(
                      //結帳欄
                      flex: 4,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 28, right: 28, bottom: 15),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 5),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '杯數',
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '金額',
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ),
                            Expanded(
                                child: TextButton(
                              onPressed: () {
                                setState(() {
                                  Controller().createOrder();
                                });
                              },
                              child: Text(
                                '結帳',
                                style: TextStyle(
                                    fontSize: 70, color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              //右半部
              flex: 7,
              child: Column(
                children: [
                  Expanded(
                    // 項目欄
                    flex: 3,
                    child: FutureBuilder<List>(
                      future: Controller().getTeaTypeData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }
                        return snapshot.hasData
                            ? TeaTypeList(
                                list: snapshot.data,
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                  Expanded(
                    // 項目欄
                    flex: 3,
                    child: FutureBuilder<List>(
                      future: Controller().getTeaNameData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }
                        return snapshot.hasData
                            ? TeaName(
                                list: snapshot.data,
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                  Expanded(
                    // 項目欄
                    flex: 3,
                    child: FutureBuilder<List>(
                      future: Controller().getAdjustData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        return snapshot.hasData
                            ? TeaAdjustList(
                                list: snapshot.data,
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
