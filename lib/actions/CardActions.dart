import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xylo/actions/ActionScreen.dart';
import 'package:xylo/model/card_data.dart';

import 'package:http/http.dart' as http;

class CardActions extends ActionScreen {
  List<CardData> cardData = [];

  Future getCardData() async {
    // const url = '5.161.97.142:9001';
    const api = 'creditcard';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    for (var term in jsonData) {
      var merch = false;
      if (term['merchantAfford'] == 1) {
        merch = true;
      }
      cardData.add(CardData(term['key'], term['description'], term['reference'],
          term['commissionPercentage'], merch));
    }
  }
}
