// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/provider/app_notifier.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppNotifier>(context);
    final DraggableScrollableController controller =
        appState.draggableScrollableController;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bottom Navigation Example'),
      ),
      body: Stack(
        children: [
          const Center(child: Text('Main Content')),
          DraggableScrollableSheet(
            controller: controller,
            initialChildSize: appState.bottomSheetSize,
            // minChildSize: 0.20,
            // maxChildSize: appState.openSize,
            minChildSize: 0.20,
            maxChildSize: 0.60,
            builder:
                (BuildContext context, ScrollController innerScrollController) {
              innerScrollController.addListener(() {
                appState.updateBottomSheetSize();
              });
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollEndNotification) {
                    final double size = controller.size;
                    if (size > 0.2 && size < 0.3) {
                      appState.closeBottomSheet(
                        forceClose: true,
                      );
                    }

                    if (size > 0.3 && size < 0.6) {
                      appState.openBottomSheet(
                        forceOpen: true,
                      );
                    }
                  }
                  return false;
                },
                child: Container(
                  color: kTransparent,
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 50.0,
                                height: 25.0,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: Center(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        appState.toggleBottomSheet();
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          appState.isBottomSheetOpen
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_up,
                                          size: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: kWhitePrimaryColor,
                          child: Stack(
                            children: [
                              GridView.builder(
                                controller: innerScrollController,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // 3 kolom dalam grid
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                                itemCount: 9, // Total item di grid
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Aksi saat item di-tap
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons
                                              .home, // Ganti dengan ikon sesuai item
                                          size: 40,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Item $index', // Ganti dengan label sesuai item
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
