import 'package:get/get.dart';

import '../Model/OrderHistoryModel.dart';

class HistoryController extends GetxController {
  //Model
  final _HistoryModel = OrderHistoryModel();

  //getData

  getHistoryListData() async {
    final _list = await _HistoryModel.getHistoryListData();
    return _list;
  }

  getHistoryDetailData() async {
    final _detail = await _HistoryModel.getHistoryDetailData();
    return _detail;
  }

  //Function

  static RxList currOrderDetail = [].obs;
  static RxInt currOrderTotalPrice = 0.obs;
  static RxString currOrderTime = ''.obs;
  getCurrOrderDetail(int index) async {
    final _list = await getHistoryListData();
    final _detail = await getHistoryDetailData();
    currOrderDetail.value = [];
    currOrderTotalPrice.value = 0;
    for (int i = 0; i < _detail.length; i++) {
      if (_list[index]['order_list_id'] == _detail[i]['order_list_id']) {
        currOrderDetail.add(_detail[i]);
      }
    }
    currOrderTotalPrice.value = int.parse(_list[index]['order_list_price']);
    currOrderTime.value = _list[index]['order_time'];
    currOrderTotalPrice.refresh();
    currOrderTime.refresh();
    currOrderDetail.refresh();
  }
}
