import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function() ontap;
 // final double width;
  const CustomButton({
    super.key,
    required this.child,
    required this.ontap,
    //required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // استخدام SizedBox بدلاً من Container هنا
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff49AEE4),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: ontap,
        child: child,
      ),
    );
  }
}


//  Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: ElevatedButton(
//                         onPressed: state is SignInLoading
//                             ? null // تعطيل الزر أثناء التحميل
//                             : () {
//                                 if (context
//                                         .read<UserCubit>()
//                                         .signInEmail
//                                         .text
//                                         .isNotEmpty &&
//                                     context
//                                         .read<UserCubit>()
//                                         .signInPassword
//                                         .text
//                                         .isNotEmpty) {
//                                   context.read<UserCubit>().signIn();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content:
//                                             Text('Please fill all fields')),
//                                   );
//                                 }
//                               },
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           minimumSize: const Size(double.infinity, 48),
//                           backgroundColor: const Color(0xff49AEE4),
//                         ),
//                         child: state is SignInLoading
//                             ? const SizedBox(
//                                 height: 24,
//                                 width: 24,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2.5,
//                                 ),
//                               )
//                             : const Text(
//                                 'Login',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                       ),
//                     ),