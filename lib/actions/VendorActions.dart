import 'dart:convert';

import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/vendors_data.dart';
import 'package:http/http.dart' as http;

class VendorActions extends ActionScreen {
  List<VendorItem> vendorItem = [];

  Future getVendorData() async {
    const url = '5.161.97.142:9001';
    const api = 'supplier';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var ven in jsonData) {
      vendorItem.add(VendorItem(
          ven['txtCscode'].toString(),
          ven['txtNamea'].toString(),
          ven['txtNamee'].toString(),
          ven['txtTel1'].toString(),
          ven['txtEmail'].toString(),
          ven['txtAddressa'].toString(),
          ven['txtCitya'].toString(),
          ven['txtAddresse'].toString(),
          ven['txtAreacode'].toString()));
    }
  }
}
