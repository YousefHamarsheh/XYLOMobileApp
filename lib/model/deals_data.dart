class DealsData {
  String id;
  bool active;
  int only_for_manager;
  String from_date;
  String to_date;
  String creation_date;
  double defualt_discount_value;
  double max_discount_for_manager;
  double max_discount_for_user;
  int deleted;
  String name;
  String related_acc_code;

  DealsData(
      this.id,
      this.active,
      this.only_for_manager,
      this.from_date,
      this.to_date,
      this.creation_date,
      this.defualt_discount_value,
      this.max_discount_for_manager,
      this.max_discount_for_user,
      this.deleted,
      this.name,
      this.related_acc_code);
}
