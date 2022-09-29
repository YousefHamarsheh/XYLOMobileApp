import 'dart:convert';

import 'package:xylo/actions/ActionScreen.dart';

import '../model/category_data .dart';
import 'package:http/http.dart' as http;

class CategActions extends ActionScreen {
  List<CategoryData> categoryData = [];

  //Get all Categories
  Future getTaxCatData() async {
    // const url = '5.161.97.142:9001';
    const api = 'taxcategory';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var pay in jsonData) {
      bool is_percent = false;
      if (pay['ispercent'] == 1) {
        is_percent = true;
      }
      categoryData.add(CategoryData(
          pay['txtKey'], pay['txtname'], is_percent, pay['dblPercent']));
    }
  }

  Future
      insertingCategoryData() async {} //Here the method that will save the payment data
}
