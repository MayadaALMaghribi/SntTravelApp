import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/verify_signup_view.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_check.dart';
import 'package:sntegpito/Features/welcome_screen/presentation/views/welcome_view.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import 'package:sntegpito/core/widgets/custom_textformfield.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          CustomSnackBar.show(context, state.message);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return VerifySignupView(
              email: context.read<UserCubit>().signUpEmail.text,
            ); //verify
          }));
          // context.read<UserCubit>().signUpName.clear();
          // context.read<UserCubit>().signUpEmail.clear();
          // context.read<UserCubit>().signUpPassport.clear();
          // context.read<UserCubit>().signUpPassword.clear();
        } else if (state is SignUpFailure) {
          CustomSnackBar.show(context, 'signup failed: ${state.errmessage}',
              isError: true);
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppBar(
            text: "",
            page: WelcomeView(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: context
                .read<UserCubit>()
                .signUpFormKey, // تعيين الـ GlobalKey هنا
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Create Account Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff49AEE4),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    const SizedBox(height: 20),
                    // Full Name
                    const Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    CustomTextformfield(
                      controller: context.read<UserCubit>().signUpName,
                      obscureText: false,
                      //hintText: 'Enter your full name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),

                    // Email
                    const Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),

                    CustomTextformfield(
                      controller: context.read<UserCubit>().signUpEmail,
                      obscureText: false,
                      //hintText: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    // Passport
                    const Row(
                      children: [
                        Text(
                          'Passport',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    CustomTextformfield(
                      controller: context.read<UserCubit>().signUpPassport,
                      obscureText: false,
                      //hintText: 'Enter your passport',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your passport number';
                        }
                        return null;
                      },
                    ),

                    // Password
                    const Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    PasswordStrengthChecker(
                      passwordController: context
                          .read<UserCubit>()
                          .signUpPassword, // إضافة الـ controller هنا
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                    // Sign Up button
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: state is SignUpLoading
                            ? null // تعطيل الزر أثناء التحميل
                            : () {
                                if (context
                                    .read<UserCubit>()
                                    .signUpFormKey
                                    .currentState!
                                    .validate()) {
                                  context.read<UserCubit>().signUp();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor: const Color(0xff49AEE4),
                        ),
                        child: state is SignUpLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
