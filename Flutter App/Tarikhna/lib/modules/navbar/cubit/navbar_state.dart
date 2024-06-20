part of 'navbar_cubit.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

class ChangedPage extends NavbarState {
  int index;

  ChangedPage({required this.index});
}
