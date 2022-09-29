import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xid/xid.dart';
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

  Future insertCardData(String ref, String description, double comPercent,
      bool merch_afford) async {
    const api = 'creditcard/save';
    var xid = Xid();
    var merch_afford_flag = 0;
    if (merch_afford) {
      merch_afford_flag = 1;
    }
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "key": xid.toString().substring(0, 7),
          "description": description,
          "reference": ref,
          "commissionPercentage": comPercent,
          "merchantAfford": merch_afford_flag
        }));
  }
}
