// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payungpribadi/common/const.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:badges/badges.dart' as badges;
import 'package:payungpribadi/presentation/provider/home_menu_notifier.dart';
import 'package:payungpribadi/presentation/widgets/home_category_tile1.dart';
import 'package:payungpribadi/presentation/widgets/home_menu_tile.dart';
import 'package:payungpribadi/presentation/widgets/initial_circle.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: kWhitePrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0), // Adjust the radius as needed
                topRight: Radius.circular(20.0), // Adjust the radius as needed
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<HomeMenuNotifier>(
                      builder: (BuildContext context,
                          HomeMenuNotifier menuState, Widget? child) {
                        return HomeCategoryTile1(
                          itemMenu: menuState.items,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget appBar(context) {
    return Container(
      height: 80,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Malam",
                  style: mainTextStyle.copyWith(color: kWhitePrimaryColor),
                ),
                Expanded(
                  child: Text(
                    "Argi Gentarna",
                    style: mainTextStyle.copyWith(
                      color: kWhitePrimaryColor,
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              badges.Badge(
                badgeContent: Text(
                  '3',
                  style: mainTextStyle.copyWith(
                    color: kWhitePrimaryColor,
                  ),
                ),
                child: SvgPicture.asset(
                  svgNotifications,
                  width: 27,
                  height: 25,
                  color: kWhitePrimaryColor,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InitialCircle(
                onPress: () {
                  Navigator.pushNamed(context, '/profile_screen');
                },
                name: 'Argi',
                size: 50,
                backgroundColor: kGrayAvatar,
                textColor: Colors.white,
                fontSize: 30,
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
