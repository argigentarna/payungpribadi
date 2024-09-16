// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/common/utils.dart';
import 'package:payungpribadi/data/models/item_menu.dart';

class HomeMenuTile extends StatelessWidget {
  final ItemMenu item;

  const HomeMenuTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            item.svgPath,
            width: 27,
            height: 25,
            color: getRandomColor(),
          ),
          Text(
            item.label,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: mainTextStyle.copyWith(
              fontSize: 12,
              fontWeight: regular,
            ),
          )
        ],
      ),
    );
  }
}
