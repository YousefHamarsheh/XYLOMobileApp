import 'package:xylo/actions/ActionScreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xylo/model/payment_data.dart';

class PaymentActions extends ActionScreen {
  List<PaymentData> paymentData = [];

  //Get Payments
  Future getPaymentData() async {
    // const url = '5.161.97.142:9001';
    const api = 'paymenttypes';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);
    // print(jsonData);
    for (var pay in jsonData) {
      // print(pay['intType']);
      bool active = false;
      if (pay['bolActive'] == 1) {
        active = true;
      }
      // print(active);
      var intType = pay['intType'];
      var isPayout = pay['isPayout'];
      var bolExcludefromcashcloserec = pay['bolExcludefromcashcloserec'];
      var txtComments = pay['txtComments'];
      var txtNamea = pay['txtNamea'];
      var txtNamee = pay['txtNamee'];
      var txtWebkey = pay['txtWebkey'];
      var txtWeburl = pay['txtWeburl'];
      var bolAllowInSales = pay['bolAllowInSales'];

      paymentData.add(PaymentData(
          intType,
          isPayout,
          active,
          bolExcludefromcashcloserec,
          txtComments,
          txtNamea,
          txtNamee,
          txtWebkey,
          txtWeburl,
          bolAllowInSales));
    }
  }

  //Insert Payments
  Future insertingPaymentData(String type_no, String description, String note,
      bool active, bool pay_out) async {
    const api = 'paymenttypes/save';
    var activeFlag = 0;
    var payOutFlag = 0;

    if (active) {
      activeFlag = 1;
    }
    if (pay_out) {
      payOutFlag = 1;
    }
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "intType": int.parse(type_no),
          "ispayout": 0,
          "bolActive": 1,
          "bolExcludefromcashcloserec": 0,
          "txtComments": note,
          "txtNamea": null,
          "txtNamee": description,
          "txtWebkey": null,
          "txtWeburl": null,
          "bolAllowInSales": 0
        }));
    // print(response.statusCode);
  } //Here the method that will save the payment data
}
