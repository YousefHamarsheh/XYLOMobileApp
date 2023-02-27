import 'package:flutter/material.dart';

import '../config.dart';

class CustomAppBar extends AppBar {
  
  final String titles;
  final Function plusButtonPress;
  CustomAppBar(  {this.titles, this.plusButtonPress,Key key})
      : super(
          key: key,
           backgroundColor: kPrymeryColor1,
      foregroundColor: textheadlinecolor,
      
          title: Text(
            titles,
            style:  const TextStyle(color: textheadlinecolor),
          ),
          elevation: 0.0,
        
          actions: <Widget>[
            buildNotifiButton(),
            Visibility(visible: plusButtonPress!=null, child: InkWell(
            onTap: ()=> plusButtonPress(),
            child:const Padding(
              padding:  EdgeInsets.only(right: 8),
              child:  Icon(
                Icons.add,
                color: textheadlinecolor,
              ),
            ),
          ),
        ),
          ],
        );
}

Padding buildNotifiButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: const [
            Center(child: Icon(Icons.notifications)),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
