import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/profile/presentation/views/widgets/custom_logout_dialog.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/custom_profile_image.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/home_bottom_bar.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/list_title_side_bar.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_state.dart';
import 'package:sntegpito/Features/profile/presentation/views/edit_profile_view.dart';
import 'package:sntegpito/core/widgets/custom_app_bar.dart';

class SideBarViewBody extends StatelessWidget {
  const SideBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدم height(context) و width(context) للحصول على الأبعاد
    double screenHeight = MediaQuery.of(context).size.height;
   // double screenWidth = MediaQuery.of(context).size.width;
    const base = "http://tourism.runasp.net/";
    //final imageUrl = Uri.encodeFull("${base}${image ?? ''}");
    //final cubit = GetCubit(DioConsumer(dio: Dio()));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: CustomAppBar(
          text: "Profile",
          page: HomeBottomBar(),
        ),
      ),
      body: BlocConsumer<GetCubit, GetState>(
        listener: (context, state) {
          if (state is GetuserprofileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Edit Profile fail: ${state.errmessage}')),
            );
          } else if (state is GetuserprofileSuccess) {
            // طباعة البيانات عشان نتاكد إنها جاية صح
            print("User profile data: ${state.getuserprofileModel.username}");
          }
        },
        builder: (context, state) {
          return state is GetuserprofileLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetuserprofileSuccess
                  ? ListView(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                screenHeight * 0.1), // نسبة من ارتفاع الشاشة
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomProfileImage(
                              icon: Icons.edit,
                              image: Uri.encodeFull(
                                      "$base${state.getuserprofileModel.profilePicture ?? ''}")
                                  .toString(),
                              radiusg: 75,
                              radiuss: 70,
                              fun: () {},
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              state.getuserprofileModel.username,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              state.getuserprofileModel.email,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 83, 80, 80),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Divider(
                              color: Color(0xFF616161),
                              thickness: 0.3,
                              indent: 60,
                              endIndent: 45,
                              height: 20,
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            ListSideBar(
                              text: "Edit Profile",
                              icon: Icons.account_circle,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const EditProfileView();
                                }));
                              },
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            ListSideBar(
                              text: "Home Page",
                              icon: Icons.home,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const HomeBottomBar();
                                }));
                              },
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            ListSideBar(
                              text: "About US",
                              icon: Icons.info_outline,
                              onTap: () {},
                            ),
                            Divider(
                              color: Colors.grey[400],
                              thickness: 0.5,
                              height: screenHeight * 0.05,
                              indent: 60,
                              endIndent: 45,
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            ListSideBar(
                              text: "Sign Out",
                              icon: Icons.exit_to_app,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const CustomLogoutDialog(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ])
                  : const Center(
                      child: Text("No profile data available"),
                    );
        },
      ),
    );
  }
}
