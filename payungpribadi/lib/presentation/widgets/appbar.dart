// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';

class Appbar extends StatelessWidget {
  final title;
  const Appbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: kWhitePrimaryColor,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(right: 35),
                child: Text(
                  title,
                  style: mainTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
