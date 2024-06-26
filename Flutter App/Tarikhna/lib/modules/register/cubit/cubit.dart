import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/register/cubit/states.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';
import 'package:tarikhna/models/login_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int? selectedOption;

  void changeSelectedOption(value){
    selectedOption = value;
    emit(RegisterChangeSelectedOption());
  }

  LoginModel? loginModel;

  void userRegister(
  {
    required String name,
    required String email,
    required String password,
    required int year,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'year': year,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }


}
