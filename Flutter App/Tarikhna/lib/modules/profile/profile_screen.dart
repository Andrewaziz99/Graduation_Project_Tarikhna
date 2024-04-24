import 'package:cherry_toast/cherry_toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';
import 'package:tarikhna/modules/profile/cubit/states.dart';
import 'package:tarikhna/modules/profile/progressBar.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

//import 'colors.dart';

class profile extends StatelessWidget {
  // bool isObscurePassword = true;
  // String dropdownValue = "one";

  var items = [
    const DropdownMenuItem(
      value: "4",
      child: Text("Grade 4"),
    ),
    const DropdownMenuItem(
      value: "5",
      child: Text("Grade 5"),
    ),
    const DropdownMenuItem(
      value: "6",
      child: Text("Grade 6"),
    ),
  ];

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController academicYearController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (BuildContext context, state) {
        if (state is ProfileSuccessState) {
          if (state.profileModel!.status!) {
            CherryToast.success(
              toastDuration: const Duration(seconds: 5),
              title: const Text('Success'),
              enableIconAnimation: true,
              description: Text(state.profileModel!.message!),
            ).show(context);
          } else {
            CherryToast.error(
              toastDuration: const Duration(seconds: 5),
              title: const Text('Error'),
              enableIconAnimation: true,
              description: Text(state.profileModel!.message!),
            ).show(context);
          }
        }

        if (state is UpdateProfileErrorState) {
          CherryToast.error(
            toastDuration: const Duration(seconds: 5),
            title: const Text('Error'),
            enableIconAnimation: true,
            description: Text(state.error!),
          ).show(context);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = ProfileCubit.get(context);
        var profileModel = cubit.profileModel;

        if (profileModel == null || profileModel.data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        usernameController.text = profileModel!.data!.name!;
        emailController.text = profileModel.data!.email!;
        academicYearController.text = profileModel.data!.year!.toString();


        return ConditionalBuilder(
          condition: profileModel != null,
          builder: (BuildContext context) =>  Scaffold(
            appBar: AppBar(
              title: const Text("Edit Profile"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        // backgroundImage: NetworkImage(
                        //    "",
                        // ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                      controller: usernameController,
                      type: TextInputType.text,
                      label: "Username",
                      prefix: Icons.person,
                      validate: (value){},
                    ),
                    const SizedBox(height: 10),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.text,
                      label: "Email",
                      prefix: Icons.email,
                      validate: (value){},
                    ),
                    const SizedBox(height: 10),
                    defaultFormField(
                      controller: oldPasswordController,
                      type: TextInputType.text,
                      label: "Old Password",
                      prefix: Icons.lock,
                      validate: (value){},
                    ),
                    const SizedBox(height: 10),
                    defaultFormField(
                      controller: newPasswordController,
                      type: TextInputType.text,
                      label: "New Password",
                      prefix: Icons.lock,
                      validate: (value){},
                    ),
                    const SizedBox(height: 10),
                    defaultFormField(
                      controller: confirmNewPasswordController,
                      type: TextInputType.text,
                      label: "Confirm New Password",
                      prefix: Icons.lock,
                      validate: (value){},
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                        items: items,
                        value: academicYearController.text,
                        onChanged: (value){
                          academicYearController.text = value.toString();
                          print(academicYearController.text);
                        }
                    ),
                    const SizedBox(height: 10),
                    defaultButton(
                      background: PrimaryColor,
                      function: () {
                        if(confirmNewPasswordController.text != newPasswordController.text){
                          CherryToast.error(
                            toastDuration: const Duration(seconds: 5),
                            title: const Text('Error'),
                            enableIconAnimation: true,
                            description: const Text('Passwords do not match'),
                          ).show(context);
                          return;
                        }else if(oldPasswordController.text.isNotEmpty && newPasswordController.text.length < 6){
                          CherryToast.error(
                            toastDuration: const Duration(seconds: 5),
                            title: const Text('Error'),
                            enableIconAnimation: true,
                            description: const Text('Password must be at least 6 characters'),
                          ).show(context);
                          return;
                        }else{
                          print(oldPasswordController.text.length);
                          print(newPasswordController.text.length);
                          cubit.updateProfile(
                            name: usernameController.text,
                            email: emailController.text,
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text,
                            year: academicYearController.text,
                          );
                        }
                      },
                      text: 'update',
                    ),


                  ],
                ),
              ),
            ),
          ),
          fallback: (BuildContext context) => const Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}