import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:order_front_end/LoginPage/LoginPage.dart';

import 'OrderMainPage/OrderMainPage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}
