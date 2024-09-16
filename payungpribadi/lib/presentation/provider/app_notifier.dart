// ignore_for_file: unused_field, unused_element, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_notifier.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier(TickerProvider tickerProvider)
      : _animationController = AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: tickerProvider,
        ),
        _opacityAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
          CurvedAnimation(
            parent: AnimationController(
              duration: const Duration(milliseconds: 300),
              vsync: tickerProvider,
            ),
            curve: Curves.easeInOut,
          ),
        ) {
    _draggableScrollableController.addListener(_handleControllerChange);

    _opacityAnimation.addListener(() {
      _opacity = _opacityAnimation.value;
      notifyListeners();
    });
  }

  final ScrollController _scrollController = ScrollController();

  late Animation<double> _opacityAnimation;

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  bool _isBottomSheetOpen = false;
  bool get isBottomSheetOpen => _isBottomSheetOpen;

  double _bottomSheetSize = 0.12;
  double get bottomSheetSize => _isBottomSheetOpen ? 0.5 : 0.12;

  final double _openSize = 0.5;
  double get openSize => _openSize;

  final double _closedSize = 0.12;
  double get closedSize => _closedSize;

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  DraggableScrollableController get draggableScrollableController =>
      _draggableScrollableController;

  double _opacity = 0.0;
  double get opacity => _opacity;

  // Color get darkOverlayColor => Color.fromRGBO(0, 0, 0, _opacity);
  Color get darkOverlayColor =>
      Color.fromRGBO(0, 0, 0, (_opacity * 0.7).clamp(0.0, 1.0));

  ScrollController get scrollController => _scrollController;

  void updateOpacity(double size) {
    final newOpacity = (0.0 + (1.0 - (size / 300))).clamp(0.0, 0.5);
    if (_opacity != newOpacity) {
      // Animate the opacity change
      animationController.animateTo(newOpacity,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      _opacity = newOpacity;
      notifyListeners();
    }

    if (size <= 0.12) {
      _opacity = 0.0;
      _isBottomSheetOpen = false;
    } else if (size >= 0.5) {
      _opacity = 0.3;
      _isBottomSheetOpen = true;
    } else {
      double opacityValue =
          (size - 0.12) / (0.3 - 0.12); // Linear interpolation
      _opacity = opacityValue.clamp(0.0, 0.3);
    }
    notifyListeners();
  }

  void _handleControllerChange() {
    // Update the bottom sheet size and opacity based on the controller's size
    double size = _draggableScrollableController.size;
    updateOpacity(size);
    notifyListeners();
  }

  void toggleBottomSheet() {
    if (_isBottomSheetOpen) {
      closeBottomSheet();
    } else {
      openBottomSheet();
    }
  }

  void updateBottomSheetSize() {
    final double size = _draggableScrollableController.size;
    final bool isSheetOpen =
        size >= _openSize - 0.05; // Tolerance for partial open state

    if (isSheetOpen != _isBottomSheetOpen) {
      _isBottomSheetOpen = isSheetOpen;
      _bottomSheetSize = isSheetOpen ? _openSize : 0.2;
      _opacity =
          size < 0.2 ? 0.0 : (0.0 + (1.0 - (size - 0.2) / 0.4)).clamp(0.0, 0.5);
      notifyListeners();
    }
  }

  void openBottomSheet({forceOpen = false}) {
    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      if (!_isBottomSheetOpen || forceOpen) {
        setBottomSheetSize(_openSize);
      }
    }).then((value) {
      if (forceOpen) {
        _isBottomSheetOpen = true;
        notifyListeners();
      }
    });
  }

  void closeBottomSheet({forceClose = false}) {
    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      if (_isBottomSheetOpen || forceClose) {
        setBottomSheetSize(_closedSize);
      }
    }).then((value) {
      if (forceClose) {
        _isBottomSheetOpen = false;

        notifyListeners();
      }
    });
  }

  void setBottomSheetSize(double size) {
    _draggableScrollableController.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.bounceInOut,
    );
    _isBottomSheetOpen =
        size >= _openSize * 0.5; // Update the state based on size
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
