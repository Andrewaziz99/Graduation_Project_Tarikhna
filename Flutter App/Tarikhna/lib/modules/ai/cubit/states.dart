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


<<<<<<< HEAD
class SavedModelLoadingState extends AIStates {}
class SavedModelSuccessState extends AIStates {}
class SavedModelErrorState extends AIStates {
  final String error;

  SavedModelErrorState(this.error);
}

class GetAllSavedItemLoadingState extends AIStates {}
class GetAllSavedItemSuccessState extends AIStates {}

class GetAllSavedItemErrorState extends AIStates {
  final String error;

  GetAllSavedItemErrorState(this.error);
}
=======

// class SavedModelLoadingState extends AIStates {}
// class SavedModelSuccessState extends AIStates {}
// class SavedModelErrorState extends AIStates {
//   final String error;
//
//   SavedModelErrorState(this.error);
// }
//
// class GetAllSavedItemLoadingState extends AIStates {}
// class GetAllSavedItemSuccessState extends AIStates {}
//
// class GetAllSavedItemErrorState extends AIStates {
//   final String error;
//
//   GetAllSavedItemErrorState(this.error);
// }
>>>>>>> 50e36da92b6d1633d3ce83860fb6db4ab43b8c38
