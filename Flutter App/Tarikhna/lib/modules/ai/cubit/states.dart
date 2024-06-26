import 'package:tarikhna/models/AI_model.dart';

abstract class AIStates {}

class AppInitialState extends AIStates {}

class TextSummarizedLoadingState extends AIStates {}

class TextSummarizedSuccessState extends AIStates {
  final AIModel? AiModel;
  TextSummarizedSuccessState(this.AiModel);
}

class TextSummarizedErrorState extends AIStates {
  final String error;

  TextSummarizedErrorState(this.error);
}

class getSummarizedTextLoadingState extends AIStates {}

class getSummarizedTextSuccessState extends AIStates {
  final AIModel? AiModel;
  getSummarizedTextSuccessState(this.AiModel);
}

class getSummarizedTextErrorState extends AIStates {
  final String error;

  getSummarizedTextErrorState(this.error);
}