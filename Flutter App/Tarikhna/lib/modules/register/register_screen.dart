import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/login/login_screen.dart';
import 'package:tarikhna/modules/register/cubit/cubit.dart';
import 'package:tarikhna/modules/register/cubit/states.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var yearController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status!) {
                navigateAndFinish(context, LoginScreen());
            } else {
              CherryToast.error(
                title: Text(state.loginModel.message!),
                toastPosition: Position.bottom,
                animationType: AnimationType.fromLeft,
                toastDuration: const Duration(seconds: 5),
                animationDuration: const Duration(milliseconds: 500),
                autoDismiss: true,
              ).show(context);

            }
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = RegisterCubit.get(context);
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                // appBar: AppBar(
                //   elevation: 0.0,
                //   backgroundColor: Colors.transparent,
                // ),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Simply fill out the form below to create your account and embark on a journey through the annals of history. Welcome aboard!',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                defaultFormField(
                                  controller: nameController,
                                  type: TextInputType.name,
                                  label: 'Username',
                                  prefix: Icons.person_outline,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  label: 'Email Address',
                                  prefix: Icons.email_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email address must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  isPassword: cubit.isPassword,
                                  label: 'Password',
                                  prefix: Icons.lock_outline,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty';
                                    }
                                    return null;
                                  },
                                  suffix: cubit.suffix,
                                  suffixPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                defaultFormField(
                                  controller: confirmPasswordController,
                                  type: TextInputType.visiblePassword,
                                  isPassword: cubit.isPassword,
                                  label: 'Confirm Password',
                                  prefix: Icons.lock_outline,
                                  validate: (value) {
                                    if (value!.isEmpty || value != passwordController.text) {
                                      return 'Password does not match';
                                    }
                                    return null;
                                  },
                                  suffix: cubit.suffix,
                                  suffixPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                RadioListTile(
                                    value: 1,
                                    title: const Text('Not Student'),
                                    groupValue: cubit.selectedOption,
                                    onChanged: (value) {
                                      yearController.text = '$value';
                                      print(value);
                                      cubit.changeSelectedOption(value);
                                    }),
                                RadioListTile(
                                    value: 4,
                                    title: const Text('4th Primary'),
                                    groupValue: cubit.selectedOption,
                                    onChanged: (value) {
                                      yearController.text = '4';
                                      cubit.changeSelectedOption(value);
                                    }),
                                RadioListTile(
                                    value: 5,
                                    title: const Text('5th Primary'),
                                    groupValue: cubit.selectedOption,
                                    onChanged: (value) {
                                      yearController.text = '5';
                                      cubit.changeSelectedOption(value);
                                    }),
                                RadioListTile(
                                    value: 6,
                                    title: const Text('6th Primary'),
                                    groupValue: cubit.selectedOption,
                                    onChanged: (value) {
                                      yearController.text = '6';
                                      cubit.changeSelectedOption(value);
                                    }),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ConditionalBuilder(
                                  condition: state is! RegisterLoadingState,
                                  builder: (BuildContext context) =>
                                      defaultButton(
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          year: int.parse(yearController.text),
                                        );
                                      }
                                    },
                                    text: 'REGISTER',
                                    isUpperCase: true,
                                    radius: 3.0,
                                    background: PrimaryColor,
                                  ),
                                  fallback: (BuildContext context) =>
                                      const Center(
                                          child: CircularProgressIndicator()),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
