import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';
import '../../../../../core/utils/assests.dart';
import '../../../../../core/widgets/custom_button.dart';
class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFC),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(AssetsData.logo),
            Text(
              'Hello , Welcome !',
              style: Styles.textStyle32.copyWith(
                color: const Color(0xff49AEE4),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            CustomButton(
              title: 'Login',
              width: double.infinity,
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Container();
                }));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Sign Up',
              width: double.infinity,
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Container();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
