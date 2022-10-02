import 'dart:convert';

import 'package:xid/xid.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/transactions/Transaction.dart';

import '../model/customer_data.dart';

import 'package:http/http.dart' as http;

class CustActions extends ActionScreen {
  List<CustomerItem> customerItem = [];
  List<CustomerItem> display_cust = [];
  //Get all Customers
  Future getCustomerData() async {
    if (customerItem.isNotEmpty) {
      return;
    }
    // const url = '5.161.97.142:9001';
    const api = 'cust';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var cust in jsonData) {
      customerItem.add(CustomerItem(
          cust['txtCode'].toString(),
          cust['txtName'].toString(),
          cust['txtTel1'].toString(),
          cust['txtEmail'].toString(),
          cust['txtAddress'].toString(),
          cust['txtCitya'].toString(),
          cust['txtAddress'].toString(),
          cust['txtAreacode'].toString()));
    }
  }

  //Inserting Customer
  Future insertingData(
      String address,
      String zipcode,
      String selectedCityValue,
      String selectedStateValue,
      String email,
      String name,
      String phonenumber) async {
    const api = 'cust/save';
    var xid = Xid();
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": xid.toString().substring(0, 7),
          "numSeq": 37,
          "bolAllowglacctransaction": 0,
          "bolLegalcase": 0,
          "datBanklgenddate": null,
          "datBanklgstartdate": null,
          "datBirthdate": null,
          "datCreationdate": null,
          "dblBanklgamt": 0.0,
          "dblCustpoints": null,
          "dblDiscountrate": 0.0,
          "dblInitcustpoints": 0.0,
          "dblLattercreditamount": 0.0,
          "dblMaxcreditamt": 0.0,
          "dblMaxcreditday": 0.0,
          "dblMaxdebitamt": 0.0,
          "dblMaxuncollectchequeamt": 0.0,
          "dblUsedcustpoints": null,
          "intCsstatus": 0,
          "intIslocal": 0,
          "intMaxnouncollectcheque": 0,
          "intRowid": 0,
          "intStatus": null,
          "intType": 0,
          "txtAcccode": null,
          "txtAddress": address,
          "txtAdvertisercode": null,
          "txtAreacode": zipcode,
          "txtCardno": null,
          "txtCategorycode": null,
          "txtCelltel": null,
          "txtCitya": selectedCityValue,
          "txtCollectorcode": null,
          "txtComment": null,
          "txtCountrya": selectedStateValue,
          "txtCreditapplications": null,
          "txtEmail": email,
          "txtFax": null,
          "txtGroup": null,
          "txtManagera": null,
          "txtName": name,
          "txtPassportcopy": null,
          "txtRank": null,
          "txtRefercode": null,
          "txtSalesmancode": null,
          "txtTel1": phonenumber,
          "txtTel2": null,
          "txtTitle": null,
          "txtUrl": null,
          "txtVatno": null
        }));
  }

  List<Transaction> dashboardItem = [];
  Future getCustTransData(String id) async {
    var api = 'invoice/cust/$id';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var cust in jsonData) {
      dashboardItem.add(Transaction(
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

  void displayCustDataArray() {
    if (display_cust.isNotEmpty) {
      return;
    }
    display_cust = List.from(customerItem);
  }

  void searchCustomer(String value) {
    display_cust = [];
    // setState(() {
    for (CustomerItem cust in customerItem) {
      if (cust.name.contains(value)) {
        display_cust.add(cust);
      }
    }
  }

  Future updateCustomer(
      String address,
      String zipcode,
      String selectedCityValue,
      String selectedStateValue,
      String email,
      String name,
      String phonenumber,
      String id) async {
    const api = 'cust/update';
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": id,
          "numSeq": 37,
          "bolAllowglacctransaction": 0,
          "bolLegalcase": 0,
          "datBanklgenddate": null,
          "datBanklgstartdate": null,
          "datBirthdate": null,
          "datCreationdate": null,
          "dblBanklgamt": 0.0,
          "dblCustpoints": null,
          "dblDiscountrate": 0.0,
          "dblInitcustpoints": 0.0,
          "dblLattercreditamount": 0.0,
          "dblMaxcreditamt": 0.0,
          "dblMaxcreditday": 0.0,
          "dblMaxdebitamt": 0.0,
          "dblMaxuncollectchequeamt": 0.0,
          "dblUsedcustpoints": null,
          "intCsstatus": 0,
          "intIslocal": 0,
          "intMaxnouncollectcheque": 0,
          "intRowid": 0,
          "intStatus": null,
          "intType": 0,
          "txtAcccode": null,
          "txtAddress": address,
          "txtAdvertisercode": null,
          "txtAreacode": zipcode,
          "txtCardno": null,
          "txtCategorycode": null,
          "txtCelltel": null,
          "txtCitya": selectedCityValue,
          "txtCollectorcode": null,
          "txtComment": null,
          "txtCountrya": selectedStateValue,
          "txtCreditapplications": null,
          "txtEmail": email,
          "txtFax": null,
          "txtGroup": null,
          "txtManagera": null,
          "txtName": name,
          "txtPassportcopy": null,
          "txtRank": null,
          "txtRefercode": null,
          "txtSalesmancode": null,
          "txtTel1": phonenumber,
          "txtTel2": null,
          "txtTitle": null,
          "txtUrl": null,
          "txtVatno": null
        }));
    print(response.statusCode);
  }
}
