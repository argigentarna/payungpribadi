class ItemMenu {
  final String svgPath;
  final String label;
  final String category;
  final bool isMainMenu;

  ItemMenu({
    required this.svgPath,
    required this.label,
    this.isMainMenu = false,
    this.category = '',
  });
}
