class DepartItem {
  final String id;
  final String dep_name; //namea
  final String print_to;
  final String name_display_on_screen; //namee
  final String priority_index;
  final String parent_dep;
  final String restrict_age;
  final String dep_image;
  final String dep_color;
  final String tax_category;
  final int show_in_pos; // add or show??
  final int show_in_mob;
  final int ebt_eligibal;
  final int modifier;
  final int express_btn;

  const DepartItem(
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
