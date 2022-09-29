import 'dart:convert';

import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/order_data.dart';
import 'package:http/http.dart' as http;

class OrderActions extends ActionScreen {
  List<OrderData> orderData = [];

  //Get Order Data
  Future getOrderData() async {
    // const url = '5.161.97.142:9001';
    const api = 'ordertypes';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var pay in jsonData) {
      bool active = false;
      if (pay['bolActive'] == 1) {
        active = true;
      }
      orderData.add(OrderData(pay['txtCode'], pay['txtNamee'], active));
    }
  }

  //Inserting Order
  Future
      insertingOrderData() async {} //Here the method that will save the payment data
}
