class Transaction {
  final String txtHdrkey;
  final int bolPrinted;
  final int bolReserved;
  final int bolReversed;
  final String datTransdate;
  final double dblGroupdiscount;
  final double dblOtherdiscount;
  final double dblPrevcustpoint;
  final double dblTotal;
  final double dblTotalcustpoint;
  final double dblTotaldiscount1;
  final double dblTotaldiscount2;
  final double dblTotaldiscount3;
  final int intSeqnum;
  final int intStatus;
  final int intType;
  final String timTranstime;
  final String txtBranchcode;
  final String txtCurrency;
  final String txtCustpointrefkey;
  final String txtDaykey;
  final String txtEmployeecode;
  final String txtJcode;
  final String txtManagerpincode;
  final String txtManagerusercode;
  final String txtNotes;
  final String txtReference3;
  final String txtReference4;
  final String txtRefrence1;
  final String txtRefrence2;
  final String txtTranscustomer;
  final String txtTranscustomername;
  final String txtTransuser;
  final String txtWarehousecode;
  final String refKey;
  final int orderStatus;
  final double totTaxAmt;
  final double ebtAmt;

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
