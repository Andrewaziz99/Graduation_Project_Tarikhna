
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';
import 'package:tarikhna/modules/profile/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class ChangePassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var oldPasswordController = TextEditingController();
    var newPasswordController = TextEditingController();
    var confirmNewPasswordController = TextEditingController();

    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (BuildContext context, state) {
        if (state is UpdateProfileErrorState) {
          CherryToast.error(
            title: const Text('Error while changing password'),
            toastPosition: Position.bottom,
            animationType: AnimationType.fromLeft,
            toastDuration: const Duration(seconds: 5),
            animationDuration: const Duration(milliseconds: 500),
            autoDismiss: true,
          ).show(context);
        }
        if (state is UpdateProfileSuccessState) {
          CherryToast.success(
            title: const Text('Password changed successfully'),
            toastPosition: Position.bottom,
            animationType: AnimationType.fromLeft,
            toastDuration: const Duration(seconds: 5),
            animationDuration: const Duration(milliseconds: 500),
            autoDismiss: true,
          ).show(context);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Change Password'),
          ),
          body: SingleChildScrollView(
            child: ConditionalBuilder(
              condition: cubit.profileModel!.data != null,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      newFormField(
                        controller: oldPasswordController,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPassword,
                        label: 'Old Password',
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validate: (val) {},
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      newFormField(
                        controller: newPasswordController,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPassword,
                        label: 'New Password',
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validate: (val) {},
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      newFormField(
                        controller: confirmNewPasswordController,
                        type: TextInputType.visiblePassword,
                        isPassword: cubit.isPassword,
                        label: 'Confirm New Password',
                        prefix: Icons.lock,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validate: (val) {},
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        background: Colors.blue,
                        function: () {
                          cubit.updateProfile(
                            name: cubit.profileModel!.data!.name!,
                            email: cubit.profileModel!.data!.email!,
                            year: cubit.profileModel!.data!.year!.toString(),
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text,
                          );
                        },
                        text: 'Change Password',
                      ),
                    ],
                  ),
                );
              },
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}
