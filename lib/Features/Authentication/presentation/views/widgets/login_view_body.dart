import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/signup_view.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_checkbox_login.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_login.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/home_bottom_bar.dart';
import 'package:sntegpito/Features/welcome_screen/presentation/views/welcome_view.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import 'package:sntegpito/core/widgets/custom_button.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import 'package:sntegpito/core/widgets/custom_textformfield.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          CustomSnackBar.show(context, "Login Successful");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomeBottomBar()),
            ModalRoute.withName('/'),
          );
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) {
          //   return const HomeBottomBar();
          // }));
        } else if (state is SignInFailure) {
          CustomSnackBar.show(context, 'Login failed: ${state.errmessage}');
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
            key: context.read<UserCubit>().signInFormKey,
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: Text(
                        'Welcome Back',
                        style: Styles.textStyle32.copyWith(
                          //textstyle 30
                          color: const Color(0xff49AEE4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      children: [
                        Text('Login to continue'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Username',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    CustomTextformfield(
                      controller: context.read<UserCubit>().signInEmail,
                      obscureText: false,
                      validator: (value) {
                        final trimmedValue = value?.trim(); // حذف المسافات

                        if (trimmedValue == null || trimmedValue.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(trimmedValue)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      'Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomPasswordLogin(
                        controller: context.read<UserCubit>().signInPassword,
                      ),
                    ),
                    const CustomCheckboxLogin(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomButton(
                        ontap: state is SignInLoading
                            ? () {} // تعطيل الزر أثناء التحميل بدون إرجاع null
                            : () {
                                final userCubit = context.read<UserCubit>();

                                if (userCubit.signInEmail.text.isNotEmpty &&
                                    userCubit.signInPassword.text.isNotEmpty) {
                                  userCubit.signIn();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Please fill all fields')),
                                  );
                                }
                              },
                        child: state is SignInLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignupView();
                            }));
                          },
                          child: const Text(
                            'Sign Up ',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
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
