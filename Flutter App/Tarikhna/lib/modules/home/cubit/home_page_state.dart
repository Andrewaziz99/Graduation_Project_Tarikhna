abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {}

class HomePageError extends HomePageState {
  final String error;

  HomePageError(this.error);
}

class HomePageChangeBottomNav extends HomePageState {}

