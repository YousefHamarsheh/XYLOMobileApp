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
    // print(jsonData[2]);
    for (var cust in jsonData) {
      // print("object");
      customerItem.add(CustomerItem(
          cust['txtCode'].toString(),
          cust['numSeq'],
          cust['bolAllowglacctransaction'],
          cust['bolLegalcase'],
          cust['datBanklgenddate'].toString(),
          cust['datBanklgstartdate'].toString(),
          cust['datBirthdate'].toString(),
          cust['datCreationdate'].toString(),
          cust['dblBanklgamt'],
          cust['dblCustpoints'],
          cust['dblDiscountrate'],
          cust['dblInitcustpoints'],
          cust['dblLattercreditamount'],
          cust['dblMaxcreditamt'],
          cust['dblMaxcreditday'],
          cust['dblMaxdebitamt'],
          cust['dblMaxuncollectchequeamt'],
          cust['dblUsedcustpoints'],
          cust['intCsstatus'],
          cust['intIslocal'],
          cust['intMaxnouncollectcheque'],
          cust['intRowid'],
          cust['intStatus'],
          cust['intType'],
          cust['txtAcccode'].toString(),
          cust['txtAddress'].toString(),
          cust['txtAdvertisercode'].toString(),
          cust['txtAreacode'].toString(),
          cust['txtCardno'].toString(),
          cust['txtCategorycode'].toString(),
          cust['txtCelltel'].toString(),
          cust['txtCitya'].toString(),
          cust['txtCollectorcode'].toString(),
          cust['txtComment'].toString(),
          cust['txtCountrya'].toString(),
          cust['txtCreditapplications'].toString(),
          cust['txtEmail'].toString(),
          cust['txtFax'].toString(),
          cust['txtGroup'].toString(),
          cust['txtManagera'].toString(),
          cust['txtName'].toString(),
          cust['txtPassportcopy'].toString(),
          cust['txtRank'].toString(),
          cust['txtRefercode'].toString(),
          cust['txtSalesmancode'].toString(),
          cust['txtTel1'].toString(),
          cust['txtTel2'].toString(),
          cust['txtTitle'].toString(),
          cust['txtUrl'].toString(),
          cust['txtVatno'].toString()));
      // print(response.statusCode);
      // print(customerItem.length);
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
    for (CustomerItem cust in customerItem) {
      if (cust.txtName.contains(value)) {
        display_cust.add(cust);
      }
    }
  }

  Future<CustomerItem> getCustomerById(String id) async {
    var api = 'cust/$id';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);
    // print(jsonData);
    // var cust = jsonData[0];
    // print(id);
    // print(cust);
    return CustomerItem(
        jsonData['txtCode'],
        jsonData['numSeq'],
        jsonData['bolAllowglacctransaction'],
        jsonData['bolLegalcase'],
        jsonData['datBanklgenddate'].toString(),
        jsonData['datBanklgstartdate'].toString(),
        jsonData['datBirthdate'].toString(),
        jsonData['datCreationdate'],
        jsonData['dblBanklgamt'],
        jsonData['dblCustpoints'],
        jsonData['dblDiscountrate'],
        jsonData['dblInitcustpoints'],
        jsonData['dblLattercreditamount'],
        jsonData['dblMaxcreditamt'],
        jsonData['dblMaxcreditday'],
        jsonData['dblMaxdebitamt'],
        jsonData['dblMaxuncollectchequeamt'],
        jsonData['dblUsedcustpoints'],
        jsonData['intCsstatus'],
        jsonData['intIslocal'],
        jsonData['intMaxnouncollectcheque'],
        jsonData['intRowid'],
        jsonData['intStatus'].toString(),
        jsonData['intType'],
        jsonData['txtAcccode'].toString(),
        jsonData['txtAddress'].toString(),
        jsonData['txtAdvertisercode'].toString(),
        jsonData['txtAreacode'].toString(),
        jsonData['txtCardno'].toString(),
        jsonData['txtCategorycode'].toString(),
        jsonData['txtCelltel'].toString(),
        jsonData['txtCitya'].toString(),
        jsonData['txtCollectorcode'].toString(),
        jsonData['txtComment'].toString(),
        jsonData['txtCountrya'].toString(),
        jsonData['txtCreditapplications'].toString(),
        jsonData['txtEmail'].toString(),
        jsonData['txtFax'].toString(),
        jsonData['txtGroup'].toString(),
        jsonData['txtManagera'].toString(),
        jsonData['txtName'].toString(),
        jsonData['txtPassportcopy'].toString(),
        jsonData['txtRank'].toString(),
        jsonData['txtRefercode'].toString(),
        jsonData['txtSalesmancode'].toString(),
        jsonData['txtTel1'].toString(),
        jsonData['txtTel2'].toString(),
        jsonData['txtTitle'].toString(),
        jsonData['txtUrl'].toString(),
        jsonData['txtVatno'].toString());
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
    CustomerItem customerUpdate = await getCustomerById(id);
    // print(customer);

    const api = 'cust/update';
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": id,
          "numSeq": customerUpdate.numSeq,
          "bolAllowglacctransaction": customerUpdate.bolAllowglacctransaction,
          "bolLegalcase": customerUpdate.bolLegalcase,
          "datBanklgenddate": customerUpdate.datBanklgenddate,
          "datBanklgstartdate": customerUpdate.datBanklgstartdate,
          "datBirthdate": customerUpdate.datBirthdate,
          "datCreationdate": customerUpdate.datCreationdate,
          "dblBanklgamt": customerUpdate.dblBanklgamt,
          "dblCustpoints": customerUpdate.dblCustpoints,
          "dblDiscountrate": customerUpdate.dblDiscountrate,
          "dblInitcustpoints": customerUpdate.dblInitcustpoints,
          "dblLattercreditamount": customerUpdate.dblLattercreditamount,
          "dblMaxcreditamt": customerUpdate.dblMaxcreditamt,
          "dblMaxcreditday": customerUpdate.dblMaxcreditday,
          "dblMaxdebitamt": customerUpdate.dblMaxdebitamt,
          "dblMaxuncollectchequeamt": customerUpdate.dblMaxuncollectchequeamt,
          "dblUsedcustpoints": customerUpdate.dblUsedcustpoints,
          "intCsstatus": customerUpdate.intCsstatus,
          "intIslocal": customerUpdate.intIslocal,
          "intMaxnouncollectcheque": customerUpdate.intMaxnouncollectcheque,
          "intRowid": customerUpdate.intRowid,
          "intStatus": customerUpdate.intStatus,
          "intType": customerUpdate.intType,
          "txtAcccode": customerUpdate.txtAcccode,
          "txtAddress": address,
          "txtAdvertisercode": customerUpdate.txtAdvertisercode,
          "txtAreacode": zipcode,
          "txtCardno": customerUpdate.txtCardno,
          "txtCategorycode": customerUpdate.txtCategorycode,
          "txtCelltel": customerUpdate.txtCelltel,
          "txtCitya": selectedCityValue,
          "txtCollectorcode": customerUpdate.txtCollectorcode,
          "txtComment": customerUpdate.txtComment,
          "txtCountrya": selectedStateValue,
          "txtCreditapplications": customerUpdate.txtCreditapplications,
          "txtEmail": email,
          "txtFax": customerUpdate.txtFax,
          "txtGroup": customerUpdate.txtGroup,
          "txtManagera": customerUpdate.txtManagera,
          "txtName": name,
          "txtPassportcopy": customerUpdate.txtPassportcopy,
          "txtRank": customerUpdate.txtRank,
          "txtRefercode": customerUpdate.txtRefercode,
          "txtSalesmancode": customerUpdate.txtSalesmancode,
          "txtTel1": phonenumber,
          "txtTel2": customerUpdate.txtTel2,
          "txtTitle": customerUpdate.txtTitle,
          "txtUrl": customerUpdate.txtUrl,
          "txtVatno": customerUpdate.txtVatno
        }));
    print(response.statusCode);
  }
}
