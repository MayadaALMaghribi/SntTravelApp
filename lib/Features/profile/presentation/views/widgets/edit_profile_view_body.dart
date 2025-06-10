import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_profile_image.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_textfield.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/list_title_side_bar.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_state.dart';
import 'package:sntegpito/Features/profile/presentation/views/update_password_view.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: CustomAppBar(
          text: "Edit Profile",
          page: SideBarView(),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UploadProfilePictureSuccess) {
            CustomSnackBar.show(
                context, 'Profile picture updated successfully');
            log("pic done");
            context.read<GetCubit>().getuserprofile();
          } else if (state is UploadProfilePictureFailure) {
            CustomSnackBar.show(
                context, 'update picture failed: ${state.errmessage}',
                isError: true);
            log("not done");
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  // 1- الخلفية
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE0F7FA),
                              Color(0xFFB3E5FC),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: WaveClipperOne(reverse: true),
                      child: Container(
                        height: 190,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFB3E5FC),
                              Color(0xFF81D4FA),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: WaveClipperOne(flip: true),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE0F7FA),
                              Color(0xFFB3E5FC),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 2- المحتوى
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 150), // نسيب مساحة فوق للـ wave
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // الصورة
                        CustomProfileImage(
                          icon: Icons.camera_alt,
                          image: context.read<ProfileCubit>().profilePic == null
                              ? CacheHelper()
                                  .getData(key: ApiKey.getprofilepicture)
                              : FileImage(File(context
                                  .read<ProfileCubit>()
                                  .profilePic!
                                  .path)),
                          radiusg: 100,
                          radiuss: 95,
                          fun: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              if (value != null) {
                                context
                                    .read<ProfileCubit>()
                                    .uploadProfilePic(value);
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 35),

                        // Textfield
                        SizedBox(
                          width: 350,
                          child: CustomTextfield(
                            obscureText: false,
                            icon: Icons.person,
                            texthint: "Enter your name",
                            controller: context
                                .read<ProfileCubit>()
                                .newusernameController,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Update password
                        ListSideBar(
                          text: "update password",
                          icon: Icons.arrow_back,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const UpdatePasswordView();
                            }));
                          },
                        ),

                        const SizedBox(height: 20),

                        // Edit profile button
                        BlocListener<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            if (state is UpdateusernameSuccess) {
                              CustomSnackBar.show(context, state.message);
                              context.read<GetCubit>().getuserprofile();
                            } else if (state is UpdateusernameFailure) {
                              CustomSnackBar.show(
                                  context, state.errmessage.toString());
                            }
                          },
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff49AEE4),
                              ),
                              onPressed: () {
                                context.read<GetCubit>().getuserprofile();
                                context.read<ProfileCubit>().updateusername();
                                context
                                    .read<ProfileCubit>()
                                    .newusernameController
                                    .clear();
                              },
                              child: state is UpdateusernameLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      "Edit profile",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/**
 * import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_profile_image.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_textfield.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/list_title_side_bar.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/profile%20cubit/profile_state.dart';
import 'package:sntegpito/Features/profile/presentation/views/update_password_view.dart';
import 'package:sntegpito/core/api/end_ponits.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: CustomAppBar(
          text: "Edit Profile",
          page: SideBarView(),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UploadProfilePictureSuccess) {
            CustomSnackBar.show(
                context, 'Profile picture updated successfully');
            log("pic done");
            context.read<GetCubit>().getuserprofile();
          } else if (state is UploadProfilePictureFailure) {
            CustomSnackBar.show(
                context, 'update picture failed: ${state.errmessage}',
                isError: true);
            log("not done");
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    context.read<ProfileCubit>().profilePic == null
                        ? CustomProfileImage(
                            icon: Icons.camera_alt,
                            image:
                                context.read<ProfileCubit>().profilePic == null
                                    ? CacheHelper()
                                        .getData(key: ApiKey.getprofilepicture)
                                    : FileImage(File(context
                                        .read<ProfileCubit>()
                                        .profilePic!
                                        .path)),
                            radiusg: 100,
                            radiuss: 95,
                            fun: () {
                              print("upload");
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) {
                                if (value != null) {
                                  context
                                      .read<ProfileCubit>()
                                      .uploadProfilePic(value);
                                }
                              });
                              // الأكشن عند الضغط على الأيقونة
                              print("Change Profile Picture");
                            },
                          )
                        : state is UploadProfilePictureLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomProfileImage(
                                icon: Icons.camera_alt,
                                image: FileImage(File(context
                                    .read<ProfileCubit>()
                                    .profilePic!
                                    .path)),
                                radiusg: 100,
                                radiuss: 95,
                                fun: () {
                                  ImagePicker()
                                      .pickImage(source: ImageSource.gallery)
                                      .then((value) {
                                    if (value != null) {
                                      context
                                          .read<ProfileCubit>()
                                          .uploadProfilePic(value);
                                    }
                                  });
                                  // الأكشن عند الضغط على الأيقونة
                                  print("Change Profile Picture");
                                },
                              ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 350,
                      child: CustomTextfield(
                        obscureText: false,
                        icon: Icons.person,
                        texthint: "Enter your name",
                        controller:
                            context.read<ProfileCubit>().newusernameController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(height: screenHeight * 0.01),
                    ListSideBar(
                      text: "update password",
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const UpdatePasswordView();
                        }));
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is UpdateusernameSuccess) {
                          CustomSnackBar.show(context, state.message);
                          context.read<GetCubit>().getuserprofile();
                        } else if (state is UpdateusernameFailure) {
                          CustomSnackBar.show(
                              context, state.errmessage.toString());
                        }
                      },
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff49AEE4),
                          ),
                          onPressed: () {
                            context.read<GetCubit>().getuserprofile();
                            context.read<ProfileCubit>().updateusername();
                          },
                          child: state is UpdateusernameLoading
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : const Text(
                                  "Edit profile",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

 */