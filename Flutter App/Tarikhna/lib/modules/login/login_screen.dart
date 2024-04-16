import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/ai/ai_input_screen.dart';
import 'package:tarikhna/modules/lessons/lessons_screen.dart';
import 'package:tarikhna/modules/login/cubit/cubit.dart';
import 'package:tarikhna/modules/login/cubit/states.dart';
import 'package:tarikhna/modules/navbar/navbar.dart';
import 'package:tarikhna/modules/register/register_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                TOKEN = state.loginModel.data!.token!;
                navigateAndFinish(context, NavBar_Page());
              });
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
          var cubit = LoginCubit.get(context);
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                ),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Welcome back to our journey through time! We\'re thrilled to see you again and continue exploring the wonders of history together. Please log in to access your account and pick up where you left off.',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
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
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                suffix: cubit.suffix,
                                suffixPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (BuildContext context) =>
                                    defaultButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  text: 'login',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context, RegisterScreen());
                                    },
                                    child: const Text(
                                      'register now',
                                      style: TextStyle(
                                          // color: PrimaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
