import 'dart:convert';

import 'package:xid/xid.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/transactions/Transaction.dart';
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

  List<Transaction> vendor_trans_item = [];
  Future geUserTransData(String id) async {
    var api = 'invoice/vendor/$id';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var cust in jsonData) {
      vendor_trans_item.add(Transaction(
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

  Future insertingVendorData(
      String name,
      String contactName,
      String phonenumber,
      String email,
      String address,
      String selectedCityValue,
      String selectedStateValue,
      String zipcode) async {
    const api = 'supplier/save';
    var xid = Xid();

    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCscode": xid.toString().substring(0, 7),
          "numSeq": 40,
          "bolAllowglacctransaction": null,
          "bolLegalcase": null,
          "datBanklgenddate": null,
          "datBanklgstartdate": null,
          "dblBanklgamt": null,
          "dblDiscountrate": null,
          "dblLattercreditamount": null,
          "dblMaxcreditamt": null,
          "dblMaxcreditday": null,
          "dblMaxdebitamt": null,
          "dblMaxuncollectchequeamt": null,
          "intCsstatus": null,
          "intMaxnouncollectcheque": null,
          "intRowid": null,
          "intStatus": null,
          "intType": null,
          "txtAcccode": null,
          "txtAddressa": null,
          "txtAddresse": address,
          "txtAreacode": zipcode,
          "txtCardno": null,
          "txtCategorycode": null,
          "txtCelltel": null,
          "txtCitya": selectedCityValue,
          "txtCitye": null,
          "txtCollectorcode": null,
          "txtComment": null,
          "txtCountrya": null,
          "txtCountrye": selectedStateValue,
          "txtCreditapplications": null,
          "txtEmail": email,
          "txtFax": null,
          "txtGroup": null,
          "txtManagera": null,
          "txtManagere": null,
          "txtNamea": name,
          "txtNamee": contactName,
          "txtPassportcopy": null,
          "txtRank": null,
          "txtRefercode": null,
          "txtTel1": phonenumber,
          "txtTel2": null,
          "txtTitle": null,
          "txtUrl": null,
          "txtVatno": null
        }));
    // print(xid);
  } //Here the method that will save the payment data
}
