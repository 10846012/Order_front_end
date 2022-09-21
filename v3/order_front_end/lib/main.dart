import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'View/LoginPage/LoginPage.dart';
import 'View/OrderPage/OrderMainPage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderMainPage(),
    );
  }
}
