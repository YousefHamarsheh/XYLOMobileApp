import 'dart:convert';

import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/transactions/Transaction.dart';
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

  List<Transaction> user_trans_item = [];
  Future geUserTransData(String id) async {
    var api = 'invoice/user/$id';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var cust in jsonData) {
      user_trans_item.add(Transaction(
          cust['txtHdrkey'].toString(),
          cust['bolPrinted'],
          cust['bolReserved'],
          cust['bolReversed'],
          cust['datTransdate'],
          cust['dblGroupdiscount'],
          cust['dblOtherdiscount'],
          cust['dblPrevcustpoint'],
          cust['dblTotal'],
          cust['dblTotalcustpoint'],
          cust['dblTotaldiscount1'],
          cust['dblTotaldiscount2'],
          cust['dblTotaldiscount3'],
          cust['intSeqnum'],
          cust['intStatus'],
          cust['intType'],
          cust['timTranstime'],
          cust['txtBranchcode'].toString(),
          cust['txtCurrency'].toString(),
          cust['txtCustpointrefkey'].toString(),
          cust['txtDaykey'].toString(),
          cust['txtEmployeecode'].toString(),
          cust['txtJcode'].toString(),
          cust['txtManagerpincode'].toString(),
          cust['txtManagerusercode'].toString(),
          cust['txtNotes'].toString(),
          cust['txtReference3'].toString(),
          cust['txtReference4'].toString(),
          cust['txtRefrence1'].toString(),
          cust['txtRefrence2'].toString(),
          cust['txtTranscustomer'].toString(),
          cust['txtTranscustomername'].toString(),
          cust['txtTransuser'].toString(),
          cust['txtWarehousecode'].toString(),
          cust['refKey'],
          cust['orderStatus'],
          cust['totTaxAmt'],
          cust['ebtAmt']));
    }
  }
}
