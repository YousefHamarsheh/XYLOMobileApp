import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/deals_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DealsActions extends ActionScreen {
  List<DealsData> dashboardItem = [];
  Future getDealsData() async {
    // const url = '5.161.97.142:9001';
    const api = 'discountrules';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var pay in jsonData) {
      bool active = false;
      if (pay['bolActive'] == 1) {
        active = true;
      }
      dashboardItem.add(DealsData(
          pay['txtCode'],
          active,
          pay['bolOnlyformanager'],
          pay['datFromdate'],
          pay['datTodate'],
          pay['dateCreationdate'],
          pay['dblDefaultdiscountvalue'],
          pay['dblMaxdiscountpermanager'],
          pay['dblMaxdiscountperuser'],
          pay['intDeleted'],
          pay['txtName'],
          pay['txtRelatedacccode']));
    }
  }
}
