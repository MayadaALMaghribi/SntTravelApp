import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/login_view.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/verify_forget_view.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import 'package:sntegpito/core/widgets/custom_textformfield.dart';

class ForgetViewBody extends StatelessWidget {
  const ForgetViewBody({super.key});

  // دالة التحقق من صحة البريد الإلكتروني
  bool isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is forgetSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return VerifyForgetView(
              email: context.read<UserCubit>().forgetemail.text,
            );
          }));
        } else if (state is forgetFailure) {
          CustomSnackBar.show(context, state.errmessage.toString(),
              isError: true);
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: CustomAppBar(
            text: "",
            page: LoginView(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: context.read<UserCubit>().forgetformKey,
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff49AEE4),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Enter your Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // استخدام نفس الـ controller لجميع الـ TextFields
                    CustomTextformfield(
                      obscureText: false,
                      controller: context
                          .read<UserCubit>()
                          .forgetemail, // Controller هنا
                      //hintText: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!isValidEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: state is forgetLoading
                            ? null // تعطيل الزر أثناء التحميل
                            : () {
                                if (context
                                    .read<UserCubit>()
                                    .forgetformKey
                                    .currentState!
                                    .validate()) {
                                  context.read<UserCubit>().forget();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor: const Color(0xff49AEE4),
                        ),
                        child: state is forgetLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                'Verify',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
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
