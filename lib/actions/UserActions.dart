import 'dart:convert';

import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/user_data.dart';
import 'package:http/http.dart' as http;

class UserActions extends ActionScreen {
  List<UserItem> userItem = [];

  Future getUsersData() async {
    // const url = '5.161.97.142:9001';
    const api = 'user';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var user in jsonData) {
      var active = false;
      if (user['bolActive'] == 1) {
        active = true;
      }
      userItem.add(UserItem(
        user['txtCode'],
        user['dblMaxdiscountrate'],
        user['intAllowopen'],
        user['intType'],
        user['txtName'],
        user['txtPincode'],
        user['txtPincodetype'],
        user['txtPwd'],
        user['bolManagement'],
        user['bolShiftReport'],
        user['bolShiftsReports'],
        user['bolCreateSales'],
        user['bolSalesList'],
        user['bolSalesEditVoid'],
        user['bolEditItems'],
        user['bolCashOut'],
        user['bolCashIn'],
        user['bolInvMngmnt'],
        user['bolAddeditItems'],
        user['bolAddeditDeps'],
        user['bolBarcodeGen'],
        user['bolStoreInf'],
        user['bolAdvanceReport'],
        active,
        user['bolClockInOut'],
        user['txtPhone'],
        user['txtEmail'],
        user['notes'],
      ));

      // print(user['txtName'] + " " + user['txtCode'].toString() + "\n");
    }
  }
}
