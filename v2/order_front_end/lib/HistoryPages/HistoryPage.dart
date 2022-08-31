import 'package:flutter/material.dart';

import 'HistoryLeft.dart';
import 'HistoryRight.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          children: [
            Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: HistoryLeft())),
            Expanded(flex: 4, child: HistoryRight())
          ],
        ),
      ),
    );
  }
}
