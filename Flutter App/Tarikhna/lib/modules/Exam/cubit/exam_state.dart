abstract class ExamStates {}

class ExamInitialState extends ExamStates {}

class ExamLoadingState extends ExamStates {}

class ExamSuccessState extends ExamStates {}

class ExamErrorState extends ExamStates {
  final String error;

  ExamErrorState(this.error);
}

class ExamChangeSelectedOptionState extends ExamStates {}

class ExamCheckAnswerState extends ExamStates {}

class ExamChangeLevelState extends ExamStates {}

class ExamChangeLevelErrorState extends ExamStates {
  final String error;

  ExamChangeLevelErrorState(this.error);
}

class ExamChangeLevelSuccessState extends ExamStates {}

class ExamChangeIndexState extends ExamStates {
  final int index;

  ExamChangeIndexState(this.index);
}

class ExamChangeDialogState extends ExamStates {}
