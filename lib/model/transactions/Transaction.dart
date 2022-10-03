class Transaction {
  String txtHdrkey;
  int bolPrinted;
  int bolReserved;
  int bolReversed;
  String datTransdate;
  double dblGroupdiscount;
  double dblOtherdiscount;
  double dblPrevcustpoint;
  double dblTotal;
  double dblTotalcustpoint;
  double dblTotaldiscount1;
  double dblTotaldiscount2;
  double dblTotaldiscount3;
  int intSeqnum;
  int intStatus;
  int intType;
  String timTranstime;
  String txtBranchcode;
  String txtCurrency;
  String txtCustpointrefkey;
  String txtDaykey;
  String txtEmployeecode;
  String txtJcode;
  String txtManagerpincode;
  String txtManagerusercode;
  String txtNotes;
  String txtReference3;
  String txtReference4;
  String txtRefrence1;
  String txtRefrence2;
  String txtTranscustomer;
  String txtTranscustomername;
  String txtTransuser;
  String txtWarehousecode;
  String refKey;
  int orderStatus;
  double totTaxAmt;
  double ebtAmt;

  Transaction(
      this.txtHdrkey,
      this.bolPrinted,
      this.bolReserved,
      this.bolReversed,
      this.datTransdate,
      this.dblGroupdiscount,
      this.dblOtherdiscount,
      this.dblPrevcustpoint,
      this.dblTotal,
      this.dblTotalcustpoint,
      this.dblTotaldiscount1,
      this.dblTotaldiscount2,
      this.dblTotaldiscount3,
      this.intSeqnum,
      this.intStatus,
      this.intType,
      this.timTranstime,
      this.txtBranchcode,
      this.txtCurrency,
      this.txtCustpointrefkey,
      this.txtDaykey,
      this.txtEmployeecode,
      this.txtJcode,
      this.txtManagerpincode,
      this.txtManagerusercode,
      this.txtNotes,
      this.txtReference3,
      this.txtReference4,
      this.txtRefrence1,
      this.txtRefrence2,
      this.txtTranscustomer,
      this.txtTranscustomername,
      this.txtTransuser,
      this.txtWarehousecode,
      this.refKey,
      this.orderStatus,
      this.totTaxAmt,
      this.ebtAmt);
}
