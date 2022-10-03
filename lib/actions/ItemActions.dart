import 'dart:convert';

import 'package:xid/xid.dart';
import 'package:xylo/model/item_data.dart';

import 'package:http/http.dart' as http;
import 'ActionScreen.dart';

class ItemActions extends ActionScreen {
  List<ItemData> itemData = [];
  // final ActionScreen actions = ActionScreen();

  Future<String> getImage(String id) async {
    var response =
        await http.get(Uri.http('x1002.asdnova.com:9001', 'productimage/$id'));
    if (response.statusCode != 204) {
      //Json Object
      String image = "";
      var jsonData = jsonDecode(response.body);
      return jsonData['blobImage'].toString();
    } else {
      // return await rootBundle
      // .loadString('assets/images/temp-image/productimage-123.txt');
      return await getImage("123");
    }
  }

  Future getItemsData() async {
    // const url = 'x1002.asdnova.com:9001';
    const api = 'products';
    var response = await http.get(Uri.http(url, api));
    var jsonData = jsonDecode(response.body);

    int counter = 0;
    for (var item in jsonData) {
      var active = false;
      if (item['bolActive'] == 1) {
        active = true;
      }
      // print(itemData.length);
      String image_path = "";
      // image_path =
      //     await getImage(item['txtCode'].toString()).catchError((error) {
      //   print(error);
      // });
      itemData.add(ItemData(
        "image_path",
        item['txtCode'],
        active,
        item['bolBatchable'],
        item['bolDonotprintprice'],
        item['bolItemizable'],
        item['bolLocal'],
        item['bolPriceincludevat'],
        item['dblCostprice'],
        item['dblCurrentqty'].toString(),
        item['dblDefaultvatrate'],
        item['dblEqv'],
        item['dblSellprice'],
        item['dblSellprice2'],
        item['dblSellprice3'],
        item['dblSellprice4'],
        item['intProducttype'],
        item['intQuantitycontrols'],
        item['txtBarcode'],
        ProductcatTbl(
            item['productcatTbl']['txtCode'],
            item['productcatTbl']['bolAllowdiscount'],
            item['productcatTbl']['datCreationdate'],
            item['productcatTbl']['intDeleted'],
            item['productcatTbl']['txtNamea'],
            item['productcatTbl']['txtNamee'],
            item['productcatTbl']['txtPrintername'],
            item['productcatTbl']['txtUsercode'],
            item['productcatTbl']['numIsParent'],
            item['productcatTbl']['txtParentCode'],
            item['productcatTbl']['printTo'],
            item['productcatTbl']['taxCategory'],
            item['productcatTbl']['smalllinemodifier'],
            item['productcatTbl']['addtopos'],
            item['productcatTbl']['showinmob'],
            item['productcatTbl']['color'],
            item['productcatTbl']['priorityindex'],
            item['productcatTbl']['age'],
            item['productcatTbl']['express'],
            item['productcatTbl']['ebt']),
        item['txtGroupreference'],
        item['txtName'],
        item['txtNotes'],
        item['txtRetsalesacccode'],
        item['txtSalesacccode'],
        item['txtStkprodno'],
        item['txtSupcode1'],
        item['txtSupcode2'],
        item['txtSupcode3'],
        item['txtUnit'],
        item['adult'],
        item['ebt'],
        item['byWeight'],
        item['itemSize'],
        item['feeMultiplier'],
        item['addToPos'],
        item['color'],
        item['taxCat'],
        item['priorityIndex'],
        item['smallLineModifier'],
        item['showinMob'],
        item['trackable'],
        item['shipping'],
        item['printTo'],
        item['express'],
      ));
      counter++;
      if (counter == 5) {
        break;
      }
    }
  }

  Future<String> insertItemData(
    String depatValue, //
    String unitValue, //
    String taxValue,
    String indexValue,
    String printValue,
    String colorValue,
    String upc,
    String itemName,
    int initQty,
    String ebt, //
    String showInPos, //
    String modifyer, //
    String age, //
    String showInMob, //
    String trackable, //
    double cost,
    double basicPrice,
    double lev2Price,
    double lev3Price,
    double lev4Price,
    double fixedFree, //
    double handlingShip, //
    String fixedFreeType, //
  ) async {
    var xid = Xid();
    String id = xid.toString().substring(0, 7);
    const api = 'products/save';
    final response = await http.post(Uri.http(url, api),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          "txtCode": "sB9eEtJPqNoQ3nH",
          "bolActive": 0,
          "bolBatchable": 0,
          "bolDonotprintprice": 0,
          "bolItemizable": 0,
          "bolLocal": 0,
          "bolPriceincludevat": 0,
          "dblCostprice": 0.00000,
          "dblCurrentqty": null,
          "dblDefaultvatrate": 0.0,
          "dblEqv": 0.0,
          "dblSellprice": 0.0,
          "dblSellprice2": 0.0,
          "dblSellprice3": 0.0,
          "dblSellprice4": 0.0,
          "intProducttype": 0,
          "intQuantitycontrols": 0,
          "txtBarcode": "19999",
          "productcatTbl": {
            "txtCode": "sB9eEtJPqNoQ3nH",
            "bolAllowdiscount": 0,
            "datCreationdate": null,
            "intDeleted": 0,
            "txtNamea": "Ahmadw3",
            "txtNamee": "Ahmadw3",
            "txtPrintername": null,
            "txtUsercode": null,
            "numIsParent": 1,
            "txtParentCode": null,
            "printTo": "0",
            "taxCategory": "10",
            "smalllinemodifier": 0,
            "addtopos": 1,
            "showinmob": 0,
            "color": "#FFFFFFFF",
            "priorityindex": "4",
            "age": "0",
            "express": 1,
            "ebt": 1
          },
          "txtGroupreference": null,
          "txtName": "Ahmadw3",
          "txtNotes": null,
          "txtRetsalesacccode": null,
          "txtSalesacccode": null,
          "txtStkprodno": null,
          "txtSupcode1": null,
          "txtSupcode2": null,
          "txtSupcode3": null,
          "txtUnit": "UNIT",
          "adult": "No",
          "ebt": "No",
          "byWeight": null,
          "itemSize": null,
          "feeMultiplier": 0.0, //fixed fee
          "addToPos": 1,
          "color": "#FFFFFFFF",
          "taxCat": "01X01X01X01",
          "priorityIndex": "1",
          "smallLineModifier": 0,
          "showinMob": 0,
          "trackable": 0,
          "shipping": 0.0,
          "printTo": null,
          "express": 1
        }));
    return id;
  }
}
