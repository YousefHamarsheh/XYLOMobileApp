class UserItem {
  String txtCode;
  double dblMaxdiscountrate;
  int intAllowopen;
  int intType;
  String txtName;
  String txtPincode;
  String txtPincodetype;
  String txtPwd;
  int bolManagement;
  int bolShiftReport;
  int bolShiftsReports;
  int bolCreateSales;
  int bolSalesList;
  int bolSalesEditVoid;
  int bolEditItems;
  int bolCashOut;
  int bolCashIn;
  int bolInvMngmnt;
  int bolAddeditItems;
  int bolAddeditDeps;
  int bolBarcodeGen;
  int bolStoreInf;
  int bolAdvanceReport;
  bool bolActive;
  int bolClockInOut;
  String txtPhone;
  String txtEmail;
  String notes;

  UserItem(
      this.txtCode,
      this.dblMaxdiscountrate,
      this.intAllowopen,
      this.intType,
      this.txtName,
      this.txtPincode,
      this.txtPincodetype,
      this.txtPwd,
      this.bolManagement,
      this.bolShiftReport,
      this.bolShiftsReports,
      this.bolCreateSales,
      this.bolSalesList,
      this.bolSalesEditVoid,
      this.bolEditItems,
      this.bolCashOut,
      this.bolCashIn,
      this.bolInvMngmnt,
      this.bolAddeditItems,
      this.bolAddeditDeps,
      this.bolBarcodeGen,
      this.bolStoreInf,
      this.bolAdvanceReport,
      this.bolActive,
      this.bolClockInOut,
      this.txtPhone,
      this.txtEmail,
      this.notes);
}
