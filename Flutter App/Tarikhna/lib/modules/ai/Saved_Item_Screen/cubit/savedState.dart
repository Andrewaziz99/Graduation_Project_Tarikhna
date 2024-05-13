import 'package:tarikhna/models/AI_model.dart';

abstract class SavedState {}

class AppInitialStatesaved extends SavedState {}



// class getSummarizedTextLoadingState extends SavedState {}
//
// class getSummarizedTextSuccessState extends SavedState {
//   final AIModel? AiModel;
//   getSummarizedTextSuccessState(this.AiModel);
// }
//
// class getSummarizedTextErrorState extends SavedState  {
//   final String error;
//
//   getSummarizedTextErrorState(this.error);
// }


class SavedModelLoadingState extends SavedState {}
class SavedModelSuccessState extends SavedState  {}
class SavedModelErrorState extends SavedState  {
  final String error;

  SavedModelErrorState(this.error);
}

class GetAllSavedItemLoadingState extends SavedState  {}
class GetAllSavedItemSuccessState extends SavedState  {}

class GetAllSavedItemErrorState extends SavedState  {
  final String error;

  GetAllSavedItemErrorState(this.error);
}