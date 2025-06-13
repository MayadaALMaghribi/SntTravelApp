import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/resetpassword_view.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class VerifyForgetView extends StatelessWidget {
  final String email;
  const VerifyForgetView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is otpSuccess) {
          CustomSnackBar.show(context, state.message);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResetPasswordView()),
              (Route) => false);
        } else if (state is otpFailure) {
          CustomSnackBar.show(
              context, "verification failed: ${state.errmessage}",
              isError: true);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      'Verify Code',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff49AEE4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter the verification code sent to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  // إدخال رمز التحقق
                  TextField(
                    controller: context.read<UserCubit>().otpcode,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Enter Code',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      counterText: '',
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                      letterSpacing: 10,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // زر التحقق
                  ElevatedButton(
                    onPressed: state is otpLoading
                        ? null // تعطيل الزر أثناء التحميل
                        : () {
                            if (context
                                .read<UserCubit>()
                                .otpcode
                                .text
                                .isNotEmpty) {
                              context.read<UserCubit>().otpForget();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: const Color(0xff49AEE4),
                    ),
                    child: state is otpLoading
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
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: const Color(0xff49AEE4),
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 50, vertical: 15),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    // ),
                    // child: const Text(
                    //   'Verify',
                    //   style: TextStyle(fontSize: 18, color: Colors.white),
                    // ),
                  ),
                  const SizedBox(height: 20),
                  // زر لإعادة إرسال الرمز
                  TextButton(
                    onPressed: () {
                      context.read<UserCubit>().resendcode(email: email);
                      context.read<UserCubit>().forgetemail.clear();
                    },
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff49AEE4),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
