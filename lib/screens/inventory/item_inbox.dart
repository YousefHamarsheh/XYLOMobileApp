import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:xylo/compononts/custom_appbar.dart';
import 'package:xylo/compononts/side_menu.dart';
import 'package:xylo/config.dart';
import 'package:xylo/model/item_data.dart';
import 'package:xylo/screens/inventory/comporents/item_card.dart';

import '../../model/item_inbox_list_data.dart';

class ItemInBox extends StatefulWidget {
  final ItemData itemData;
  const ItemInBox({Key key, @required this.itemData}) : super(key: key);

  @override
  State<ItemInBox> createState() => _ItemInBoxState();
}

class _ItemInBoxState extends State<ItemInBox> {
  List<ItemBoxData> itemBoxData = [
    ItemBoxData("02", "10"),
    ItemBoxData("02", "10"),
  ];

  final TextEditingController textEditingControllerQty =
      TextEditingController();
  final TextEditingController textEditingControllerPrice =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingControllerPrice.text = "10";
    textEditingControllerQty.text = "10";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: buildBottomButtons(context),
      drawer: const SideMenu(),
      appBar: CustomAppBar(titles: "Inventory"),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemCard(
                  itemData: widget.itemData,
                  optionOnTap: () => null,
                  optionButton: false,
                  screenHeight: screenHeight),
              buildList(screenHeight),
              buildQtyPriceSetter()
            ],
          ),
        ),
      ),
    );
  }

  Container buildQtyPriceSetter() {
    return Container(
      height: 110,
      decoration: buildBoxDecoration(kPrymeryColor1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLabledTextFeild("Quantity", textEditingControllerQty),
          const SizedBox(
            width: 16,
          ),
          buildLabledTextFeild("Price", textEditingControllerPrice),
          const SizedBox(
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: buildAddButton(),
          )
        ],
      ),
    );
  }

  Padding buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 55,
              width: double.maxFinite,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: buildBoxDecoration(kPrymeryColor2),
              child:  Text(
                'SHOW CHANGES',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 55,
              width: double.maxFinite,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                'CANCEL',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildLabledTextFeild(
      String label, TextEditingController textEditingController) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: textheadlinecolor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        buildTextField(textEditingController)
      ],
    );
  }

  InkWell buildAddButton() {
    return InkWell(
      onTap: () {
        itemBoxData.add(ItemBoxData(
            textEditingControllerQty.text, textEditingControllerPrice.text));
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kPrymeryColor2, borderRadius: BorderRadius.circular(6)),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.add,
              color: kPrymeryColor2,
              size: 35,
            )),
      ),
    );
  }

  Container buildTextField(TextEditingController textEditingController) {
    return Container(
      height: 55,
      width: 120,
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: textheadlinecolor, width: 2),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
        style: const TextStyle(
            color: kPrymeryColor2, fontWeight: FontWeight.bold, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Padding buildList(double screenHeight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: screenHeight * 0.30,
        child: ListView.builder(
            itemCount: itemBoxData.length,
            itemBuilder: (context, index) {
              return buildCard(
                  itemBoxData[index].quantity, itemBoxData[index].price);
            }),
      ),
    );
  }

  Container buildCard(String qty, String price) {
    return Container(
     
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: buildBoxDecoration(kPrymeryColor1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quantity",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    qty,
                    style: const TextStyle(
                        color: textheadlinecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                width: 36,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.edit,
            color: kPrymeryColor2,
            size: 40,
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration(Color color) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(6));
  }
}
