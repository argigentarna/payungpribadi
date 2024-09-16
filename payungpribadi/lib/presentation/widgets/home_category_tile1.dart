import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/data/models/item_menu.dart';
import 'package:payungpribadi/presentation/widgets/home_menu_tile.dart';

class HomeCategoryTile1 extends StatelessWidget {
  final List<ItemMenu> itemMenu;

  const HomeCategoryTile1({
    super.key,
    required this.itemMenu,
  });

  @override
  Widget build(BuildContext context) {
    final groupedItems = _groupItemsByCategory(itemMenu);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedItems.entries.map((entry) {
        final category = entry.key;
        final items = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: mainTextStyle.copyWith(
                fontSize: 23,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.start,
              children: items
                  .map(
                    (i) => HomeMenuTile(
                      item: i,
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      }).toList(),
    );
  }

  Map<String, List<ItemMenu>> _groupItemsByCategory(List<ItemMenu> items) {
    final Map<String, List<ItemMenu>> groupedItems = {};

    for (var item in items) {
      if (groupedItems.containsKey(item.category)) {
        groupedItems[item.category]!.add(item);
      } else {
        groupedItems[item.category] = [item];
      }
    }

    return groupedItems;
  }
}
