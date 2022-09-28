class PaymentData {
  final int int_type;
  final int is_payout;
  final bool active;
  final int exclude_from_cash_close_rec;
  final String comments;
  final String namea;
  final String namee;
  final String web_key;
  final String web_url;
  final int allow_in_sales;

  const PaymentData(
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
