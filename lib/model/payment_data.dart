class PaymentData {
  int int_type;
  int is_payout;
  bool active;
  int exclude_from_cash_close_rec;
  String comments;
  String namea;
  String namee;
  String web_key;
  String web_url;
  int allow_in_sales;

  PaymentData(
      this.int_type,
      this.is_payout,
      this.active,
      this.exclude_from_cash_close_rec,
      this.comments,
      this.namea,
      this.namee,
      this.web_key,
      this.web_url,
      this.allow_in_sales);
}
