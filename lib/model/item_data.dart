class ItemData {
  String imagePath;
  String txtCode;
  bool bolActive;
  int bolBatchable;
  int bolDonotprintprice;
  int bolItemizable;
  int bolLocal;
  int bolPriceincludevat;
  double dblCostprice;
  String dblCurrentqty;
  double dblDefaultvatrate;
  double dblEqv;
  double dblSellprice;
  double dblSellprice2;
  double dblSellprice3;
  double dblSellprice4;
  int intProducttype;
  int intQuantitycontrols;
  String txtBarcode;
  ProductcatTbl productcatTbl;
  String txtGroupreference;
  String txtName;
  String txtNotes;
  String txtRetsalesacccode;
  String txtSalesacccode;
  String txtStkprodno;
  String txtSupcode1;
  String txtSupcode2;
  String txtSupcode3;
  String txtUnit;
  String adult;
  String ebt;
  int byWeight; //??
  int itemSize; //??
  double feeMultiplier;
  int addToPos;
  String color;
  String taxCat;
  String priorityIndex;
  int smallLineModifier;
  int showinMob;
  int trackable;
  double shipping;
  String printTo;
  int express;

  ItemData(
      this.imagePath,
      this.txtCode,
      this.bolActive,
      this.bolBatchable,
      this.bolDonotprintprice,
      this.bolItemizable,
      this.bolLocal,
      this.bolPriceincludevat,
      this.dblCostprice,
      this.dblCurrentqty,
      this.dblDefaultvatrate,
      this.dblEqv,
      this.dblSellprice,
      this.dblSellprice2,
      this.dblSellprice3,
      this.dblSellprice4,
      this.intProducttype,
      this.intQuantitycontrols,
      this.txtBarcode,
      this.productcatTbl,
      this.txtGroupreference,
      this.txtName,
      this.txtNotes,
      this.txtRetsalesacccode,
      this.txtSalesacccode,
      this.txtStkprodno,
      this.txtSupcode1,
      this.txtSupcode2,
      this.txtSupcode3,
      this.txtUnit,
      this.adult,
      this.ebt,
      this.byWeight,
      this.itemSize,
      this.feeMultiplier,
      this.addToPos,
      this.color,
      this.taxCat,
      this.priorityIndex,
      this.smallLineModifier,
      this.showinMob,
      this.trackable,
      this.shipping,
      this.printTo,
      this.express);
}

class ProductcatTbl {
  String txtCode;
  int bolAllowdiscount;
  String datCreationdate;
  int intDeleted;
  String txtNamea;
  String txtNamee;
  String txtPrintername;
  String txtUsercode;
  int numIsParent;
  String txtParentCode;
  String printTo;
  String taxCategory;
  int smalllinemodifier;
  int addtopos;
  int showinmob;
  String color;
  String priorityindex;
  String age;
  int express;
  int ebt;

  ProductcatTbl(
      this.txtCode,
      this.bolAllowdiscount,
      this.datCreationdate,
      this.intDeleted,
      this.txtNamea,
      this.txtNamee,
      this.txtPrintername,
      this.txtUsercode,
      this.numIsParent,
      this.txtParentCode,
      this.printTo,
      this.taxCategory,
      this.smalllinemodifier,
      this.addtopos,
      this.showinmob,
      this.color,
      this.priorityindex,
      this.age,
      this.express,
      this.ebt);
}
