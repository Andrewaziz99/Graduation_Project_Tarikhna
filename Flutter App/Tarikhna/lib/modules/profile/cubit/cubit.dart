import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/profile_model.dart';
import 'package:tarikhna/models/profile_update_model.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/profile/cubit/states.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ProfileChangePasswordVisibilityState());
  }

  ProfileModel? profileModel;

  void getProfile() {
    emit(ProfileLoadingState());
    DioHelper.getData(
      url: PROFILE,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(ProfileSuccessState(profileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState(error.toString()));
    });
  }

  UpdateProfileModel? updateProfileModel;

  void updateProfile({
    String? name,
    String? email,
    String? oldPassword,
    String? newPassword,
    String? year,
    }) {
emit(UpdateProfileLoadingState());
    DioHelper.putData(
      url: UPDATE,
      data: {
        'newName': name,
        'newEmail': email,
        'oldPass': oldPassword,
        'newPass': newPassword,
        'newYear': year,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      getProfile();
      LessonsCubit().getLessons();
      print(value.data);
      updateProfileModel = UpdateProfileModel.fromJson(value.data);
      emit(UpdateProfileSuccessState(updateProfileModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileErrorState(error.toString()));
    });
  }


  }
