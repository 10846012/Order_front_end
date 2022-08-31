import 'package:get/get.dart';

import '../OrderMainPage/OrderRightSide/getOrderSideData.dart';

class HistoryGetx extends GetxController {
  var DataController = new getOrderSideData();

  List HistoryData = [];
  static RxString currHistoryId = ''.obs;
  static RxList currHistoryItem = [].obs;
  static RxString currHistoryPrice = ''.obs;
  static RxString currHistoryTime = ''.obs;
  static RxList showHistoryOrder = [].obs;

  showHistory(int i) async {
    final items = await DataController.getHistoryItems();
    final data = await DataController.getHistoryList();

    showHistoryOrder = [].obs;
    if (data.isNotEmpty) {
      currHistoryId.value = data[i]['order_list_id'];
      currHistoryPrice.value = data[i]['order_list_price'];
      currHistoryTime.value = data[i]['order_time'];
    }
    for (int j = 0; j < items.length; j++) {
      Map tempMap = {};
      if (items[j]['order_list_id'] == data[i]['order_list_id']) {
        tempMap['order_item_value'] = items[j]['order_item_value'];
        tempMap['order_item_adjust'] = items[j]['order_item_adjust'];
        tempMap['order_item_size'] = items[j]['order_item_size'];
        tempMap['order_item_count'] = items[j]['order_item_count'];
        tempMap['order_item_price'] = int.parse(items[j]['order_item_count']) *
            int.parse(items[j]['order_item_price']);

        showHistoryOrder.add(tempMap);
      }
    }
  }
}
