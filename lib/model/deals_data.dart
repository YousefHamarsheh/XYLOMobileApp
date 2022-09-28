class DealsData {
  final String id;
  final bool active;
  final int only_for_manager;
  final String from_date;
  final String to_date;
  final String creation_date;
  final double defualt_discount_value;
  final double max_discount_for_manager;
  final double max_discount_for_user;
  final int deleted;
  final String name;
  final String related_acc_code;

  const DealsData(
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
