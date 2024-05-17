import 'package:tarikhna/models/profile_model.dart';
import 'package:tarikhna/models/profile_update_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  final ProfileModel profileModel;

  ProfileSuccessState(this.profileModel);
}

class ProfileErrorState extends ProfileStates {
  final String error;

  ProfileErrorState(this.error);
}

class ProfileChangePasswordVisibilityState extends ProfileStates {}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {
  final UpdateProfileModel updateProfileModel;

  UpdateProfileSuccessState(this.updateProfileModel);
}

class UpdateProfileErrorState extends ProfileStates {
  final String error;

  UpdateProfileErrorState(this.error);
}