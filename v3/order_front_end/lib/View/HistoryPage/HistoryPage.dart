import 'package:flutter/material.dart';

import 'HistoryDetail.dart';
import 'HistoryList.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: HistoryList())),
          Expanded(flex: 5, child: HistoryDetail())
        ],
      ),
    );
  }
}
