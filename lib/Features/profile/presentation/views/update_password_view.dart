import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_check.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_login.dart';
import 'package:sntegpito/Features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class UpdatePasswordView extends StatelessWidget {
  final bool _isPasswordMatch = true;

  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdatepasswordSuccess) {
          Navigator.pop(context);
        } else if (state is UpdateusernameFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errmessage),
          ));
        }
      },
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(16),
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

                /// Old Password
                const Text(
                  'Old Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                CustomPasswordLogin(
                  controller:
                      context.read<ProfileCubit>().oldpasswordController,
                ),
                const SizedBox(height: 20),

                /// New Password + Checker
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                PasswordStrengthChecker(
                  passwordController:
                      context.read<ProfileCubit>().updatePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                /// Confirm Password
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                CustomPasswordLogin(
                  controller:
                      context.read<ProfileCubit>().confirmeupdatepassController,
                ),
                const SizedBox(height: 10),

                /// Password mismatch message
                _isPasswordMatch
                    ? const SizedBox.shrink()
                    : const Text(
                        'Password is not matched',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                const SizedBox(height: 20),

                /// Submit Button
                ElevatedButton(
                  onPressed: state is UpdatepasswordLoading
                      ? null
                      : () {
                          if (context
                                  .read<ProfileCubit>()
                                  .updatePasswordController
                                  .text
                                  .isNotEmpty &&
                              context
                                  .read<ProfileCubit>()
                                  .confirmeupdatepassController
                                  .text
                                  .isNotEmpty) {
                            context.read<ProfileCubit>().updatepassword();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: const Color(0xff49AEE4),
                  ),
                  child: state is UpdatepasswordLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'Update Password',
                          style: TextStyle(color: Colors.white),
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

/**
 * import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_state.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_check.dart';
import 'package:sntegpito/Features/Authentication/presentation/views/widgets/custom_password_login.dart';

//in profile page

class UpdatePasswordView extends StatelessWidget {
  // bool _obscureConfirmPassword = true;
  final bool _isPasswordMatch = true;
  // final bool _isPasswordEmpty = false;

  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdatepasswordSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SideBarView(),
            ),
          );
        } else if (state is UpdateusernameFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errmessage),
          ));
        }
      },
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return SizedBox(
              height: 300,
              child: ListView(
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
                        Expanded(
                          child: Row(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Old Password',
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
                                        .read<ProfileCubit>()
                                        .oldpasswordController,
                                  )),
                              const SizedBox(height: 10),
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PasswordStrengthChecker(
                          passwordController: context
                              .read<ProfileCubit>()
                              .updatePasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // Confirm password field
                        Expanded(
                          child: const Row(
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
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: CustomPasswordLogin(
                            controller: context
                                .read<ProfileCubit>()
                                .confirmeupdatepassController,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password match validation message
                        _isPasswordMatch
                            ? Container()
                            : const Text(
                                'Password is not matched',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              ),
                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: state is UpdatepasswordLoading
                                ? null // تعطيل الزر أثناء التحميل
                                : () {
                                    if (context
                                            .read<ProfileCubit>()
                                            .updatePasswordController
                                            .text
                                            .isNotEmpty &&
                                        context
                                            .read<ProfileCubit>()
                                            .confirmeupdatepassController
                                            .text
                                            .isNotEmpty) {
                                      context
                                          .read<ProfileCubit>()
                                          .updatepassword();
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              minimumSize: const Size(double.infinity, 48),
                              backgroundColor: const Color(0xff49AEE4),
                            ),
                            child: state is UpdatepasswordLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Text(
                                    'update Password',
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
              ),
            );
          },
        ),
      ),
    );
  }
}
 */
