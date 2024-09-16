class StepModel {
  final String title;
  final String description;
  final bool isCompleted;

  StepModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
