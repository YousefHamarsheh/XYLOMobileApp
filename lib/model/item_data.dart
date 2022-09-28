class ItemData {
  final String imagePath;
  final String txtCode;
  final bool bolActive;
  final int bolBatchable;
  final int bolDonotprintprice;
  final int bolItemizable;
  final int bolLocal;
  final int bolPriceincludevat;
  final double dblCostprice;
  final double dblCurrentqty;
  final double dblDefaultvatrate;
  final double dblEqv;
  final double dblSellprice;
  final double dblSellprice2;
  final double dblSellprice3;
  final double dblSellprice4;
  final int intProducttype;
  final int intQuantitycontrols;
  final String txtBarcode;
  final ProductcatTbl productcatTbl;
  final String txtGroupreference;
  final String txtName;
  final String txtNotes;
  final String txtRetsalesacccode;
  final String txtSalesacccode;
  final String txtStkprodno;
  final String txtSupcode1;
  final String txtSupcode2;
  final String txtSupcode3;
  final String txtUnit;
  final String adult;
  final String ebt;
  final int byWeight; //
  final int itemSize; //
  final double feeMultiplier;
  final int addToPos;
  final String color;
  final String taxCat;
  final String priorityIndex;
  final int smallLineModifier;
  final int showinMob;
  final int trackable;
  final double shipping;
  final String printTo;
  final int express;

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
  final String txtCode;
  final int bolAllowdiscount;
  final String datCreationdate;
  final int intDeleted;
  final String txtNamea;
  final String txtNamee;
  final String txtPrintername;
  final String txtUsercode;
  final int numIsParent;
  final String txtParentCode;
  final String printTo;
  final String taxCategory;
  final int smalllinemodifier;
  final int addtopos;
  final int showinmob;
  final String color;
  final String priorityindex;
  final String age;
  final int express;
  final int ebt;

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
