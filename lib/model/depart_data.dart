class DepartItem {
  String id;
  String dep_name; //namea
  String print_to;
  String name_display_on_screen; //namee
  String priority_index;
  String parent_dep;
  String restrict_age;
  String dep_image;
  String dep_color;
  String tax_category;
  int show_in_pos; // add or show??
  int show_in_mob;
  int ebt_eligibal;
  int modifier;
  int express_btn;

  DepartItem(
      this.id,
      this.dep_name,
      this.print_to,
      this.name_display_on_screen,
      this.priority_index,
      this.parent_dep,
      this.restrict_age,
      this.dep_image,
      this.dep_color,
      this.tax_category,
      this.show_in_pos,
      this.show_in_mob,
      this.ebt_eligibal,
      this.modifier,
      this.express_btn);
}
