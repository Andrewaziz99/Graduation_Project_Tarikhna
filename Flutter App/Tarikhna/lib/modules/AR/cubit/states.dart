abstract class ARState  {}

class ARInitialState extends ARState {}

class ARLoadingState extends ARState {}

class ARSuccessState extends ARState {}

class ARErrorState extends ARState {
  final String error;

  ARErrorState(this.error);
}

class ARTextLoadingState extends ARState {}

class ARTextSuccessState extends ARState {
  final String text;

  ARTextSuccessState(this.text);
}

class ARTextErrorState extends ARState {
  final String error;

  ARTextErrorState(this.error);
}