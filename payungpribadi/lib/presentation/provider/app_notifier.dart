// ignore_for_file: unused_field, unused_element

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _isBottomSheetOpen = false;
  bool get isBottomSheetOpen => _isBottomSheetOpen;

  double _bottomSheetSize = 0.2;
  double get bottomSheetSize => _isBottomSheetOpen ? 0.5 : 0.20;

  final double _openSize = 0.6;
  double get openSize => _openSize;

  final double _closedSize = 0.2;
  double get closedSize => _closedSize;

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  DraggableScrollableController get draggableScrollableController =>
      _draggableScrollableController;

  void setIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
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
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceInOut,
    );
    _isBottomSheetOpen =
        size >= _openSize * 0.5; // Update the state based on size
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
