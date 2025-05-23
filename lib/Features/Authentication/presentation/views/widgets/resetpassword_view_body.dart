import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_cubit.dart';
import 'package:sntegpito/Features/Authentication/presentation/manager/user%20cubit/user_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/login_view.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_check.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_login.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class ResetpasswordViewBody extends StatelessWidget {
  const ResetpasswordViewBody({super.key});
  // bool _obscureConfirmPassword = true;
  final bool _isPasswordMatch = true;
  //final bool _isPasswordEmpty = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is resetpassSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        } else if (state is resetpassFailure) {
          CustomSnackBar.show(context, state.errmessage);
        }
      },
      child: Scaffold(
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Set new password',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff49AEE4),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Create new password.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // Password field
                      const Row(
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      PasswordStrengthChecker(
                        passwordController:
                            context.read<UserCubit>().newpasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),

                      // Confirm password field
                      const Row(
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: CustomPasswordLogin(
                          controller: context
                              .read<UserCubit>()
                              .confirmPasswordController,
                        ),
                        // TextFormField(
                        //   controller: context.read<UserCubit>().confirmPasswordController,
                        //   obscureText: _obscureConfirmPassword,
                        //   cursorColor: Colors.black,
                        //   decoration: InputDecoration(
                        //     fillColor: const Color.fromARGB(255, 241, 238, 238),
                        //     filled: true,
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //       borderSide: const BorderSide(
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //       borderSide: const BorderSide(
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //       borderSide: const BorderSide(
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //     suffixIcon: IconButton(
                        //       icon: Icon(
                        //         _obscureConfirmPassword
                        //             ? Icons.visibility_off
                        //             : Icons.visibility,
                        //       ),
                        //       onPressed: () {
                        //         setState(() {
                        //           _obscureConfirmPassword =
                        //               !_obscureConfirmPassword;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ),
                      const SizedBox(height: 10),

                      // Password match validation message
                      _isPasswordMatch
                          ? Container()
                          : const Text(
                              'Password is not matched',
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: state is resetpassLoading
                              ? null // تعطيل الزر أثناء التحميل
                              : () {
                                  if (context
                                          .read<UserCubit>()
                                          .newpasswordController
                                          .text
                                          .isNotEmpty &&
                                      context
                                          .read<UserCubit>()
                                          .confirmPasswordController
                                          .text
                                          .isNotEmpty) {
                                    context.read<UserCubit>().resetPassword();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            minimumSize: const Size(double.infinity, 48),
                            backgroundColor: const Color(0xff49AEE4),
                          ),
                          child: state is resetpassLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text(
                                  'Reset Password',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),

                      // CustomButton(
                      //
                      //   title: 'Reset Password',
                      //   ontap: () {
                      //     // Check if password is empty
                      //     _isPasswordEmpty = context
                      //             .read<UserCubit>()
                      //             .newpasswordController
                      //             .text
                      //             .isEmpty ||
                      //         context
                      //             .read<UserCubit>()
                      //             .confirmPasswordController
                      //             .text
                      //             .isEmpty;
                      //     // Check if password matches
                      //     _isPasswordMatch = context
                      //             .read<UserCubit>()
                      //             .newpasswordController
                      //             .text ==
                      //         context
                      //             .read<UserCubit>()
                      //             .confirmPasswordController
                      //             .text;

                      //     if (_isPasswordEmpty) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text('Please fill in all fields')),
                      //       );
                      //     } else if (_isPasswordMatch) {
                      //       // Perform reset password action and navigate to HomeBottomBar
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text('Password Reset Successfully')),
                      //       );
                      //       Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const HomeBottomBar(),
                      //         ),
                      //       );
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text('Passwords do not match')),
                      //       );
                      //     }
                      //   },
                      //   width: double.infinity,
                      // ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
