part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

class SummaryAIState extends HomePageState {}

class NavigateToLessonState extends HomePageState {}

class OpenDrawer extends HomePageState {}
