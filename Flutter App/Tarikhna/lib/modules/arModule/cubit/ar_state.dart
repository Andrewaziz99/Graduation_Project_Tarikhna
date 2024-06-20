part of 'ar_cubit.dart';

@immutable
sealed class ArState {}

final class ArInitial extends ArState {}

class LandingSreenCreated extends ArState {}

class AROpenWidget extends ArState {}
