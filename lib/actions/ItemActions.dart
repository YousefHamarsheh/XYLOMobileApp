import 'dart:convert';

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
    String upc,
    String itemName,
    String depName,
    String initialInventoryQty,
    String unit,
    String printTo,
    String itemColor,
    String taxCategory,
  ) {}
}
