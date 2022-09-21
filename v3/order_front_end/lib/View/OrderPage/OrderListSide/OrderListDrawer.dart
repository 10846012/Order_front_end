import 'package:flutter/material.dart';

import '../../LoginPage/LoginPage.dart';
import '../OrderMainPage.dart';

class OrderListDrawer extends StatelessWidget {
  const OrderListDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0, left: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 40,
                              ))),
                    ),
                  )),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '設定',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '重新同步資料',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        '登出',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '切換介面',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
              Expanded(flex: 4, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
