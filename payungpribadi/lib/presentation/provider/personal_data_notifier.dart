import 'package:flutter/material.dart';
import 'package:payungpribadi/data/models/personal_data_step.dart';
import 'package:payungpribadi/data/models/step_model.dart';

class PersonalDataNotifier extends ChangeNotifier {
  int _currentStep = 1;
  int get selectedStep => _currentStep;

  void setStep(int index) {
    if (_currentStep != index) {
      _currentStep = index;
      notifyListeners();
    }
  }

  final List<StepModel> _steps = [
    StepModel(
      title: '1',
      description: 'Biodata Diri',
    ),
    StepModel(
      title: '2',
      description: 'Alamat Pribadi',
    ),
    StepModel(
      title: '3',
      description: 'Informasi Perusahaan',
    ),
  ];

  List<StepModel> get steps => _steps;
}
