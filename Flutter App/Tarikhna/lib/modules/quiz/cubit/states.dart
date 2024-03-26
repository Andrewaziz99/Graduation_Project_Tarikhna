abstract class QuizStates {}

class QuizInitialState extends QuizStates {}

class QuizLoadingState extends QuizStates {}

class QuizSuccessState extends QuizStates {}

class QuizErrorState extends QuizStates {
  final String error;

  QuizErrorState(this.error);
}

class QuizChangeSelectedOptionState extends QuizStates {}