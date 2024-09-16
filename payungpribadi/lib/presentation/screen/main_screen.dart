// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payungpribadi/common/const.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/provider/app_notifier.dart';
import 'package:payungpribadi/presentation/provider/menu_notifier.dart';
import 'package:payungpribadi/presentation/widgets/shadow_paint.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Color selectedColor(bool isSelected) {
    return isSelected ? kPrimaryColor : kCharcoalGrayColor;
  }

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppNotifier>(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Consumer2<AppNotifier, MenuNotifier>(builder: (
          context,
          appState,
          menuState,
          child,
        ) {
          return Stack(
            children: [
              Positioned.fill(
                child: menuState.mainContent,
              ),
              AnimatedBuilder(
                animation: appState.animationController,
                builder: (BuildContext context, Widget? child) {
                  return IgnorePointer(
                    child: Container(
                      color: appState.darkOverlayColor,
                      child:
                          const SizedBox.expand(), // Expands to fill the screen
                    ),
                  );
                },
              ),
              DraggableScrollableSheet(
                controller: appState.draggableScrollableController,
                initialChildSize: appState.bottomSheetSize,
                minChildSize: 0.12,
                maxChildSize: 0.50,
                expand: true,
                builder: (
                  BuildContext context,
                  ScrollController innerScrollController,
                ) {
                  innerScrollController.addListener(() {
                    appState.updateBottomSheetSize();
                  });
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      appState.updateOpacity(
                          appState.draggableScrollableController.size);
                      if (notification is ScrollEndNotification) {
                        final double size =
                            appState.draggableScrollableController.size;
                        if (size > 0.12 && size < 0.3) {
                          appState.closeBottomSheet(
                            forceClose: true,
                          );
                        }

                        if (size > 0.3 && size < 5) {
                          appState.openBottomSheet(
                            forceOpen: true,
                          );
                        }
                      }
                      return false;
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 17),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // Shadow color with opacity
                                blurRadius: 6, // How much the shadow spreads
                                spreadRadius: 3, // How much the shadow spreads
                              ),
                            ],
                            color: kWhitePrimaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                          ),
                          child: GridView.builder(
                            padding: const EdgeInsets.all(15),
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: innerScrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // 3 kolom dalam grid
                              crossAxisSpacing: 3.0,
                              mainAxisSpacing: 3.0,
                            ),
                            itemCount:
                                menuState.items.length, // Total item di grid
                            itemBuilder: (context, index) {
                              final item = menuState.items[index];
                              final iconPath = item.svgPath;
                              final label = item.label;
                              bool isSelected =
                                  menuState.selectedIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  menuState.selectIndex(context, index);
                                },
                                child: Container(
                                  color: kTransparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SvgPicture.asset(
                                        iconPath,
                                        width: 27,
                                        height: 25,
                                        color: selectedColor(isSelected),
                                      ),
                                      const SizedBox(height: 1.0),
                                      Text(
                                        label,
                                        style: mainTextStyle.copyWith(
                                          fontSize: 12,
                                          color: selectedColor(isSelected),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        CustomPaint(
                          painter: ShadowPainter(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.1,
                                  ), // Shadow color with opacity
                                  offset: const Offset(
                                    0,
                                    -2,
                                  ), // Shadow offset to position it on top
                                  blurRadius:
                                      0.3, // How much the shadow spreads
                                  spreadRadius:
                                      0.0, // How much the shadow spreads
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                appState.toggleBottomSheet();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                child: Icon(
                                  appState.isBottomSheetOpen
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
