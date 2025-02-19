import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';

class CustomImageHome extends StatelessWidget {
  const CustomImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: AspectRatio(
        aspectRatio: 17 / 7,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/home_entrat.jpg"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            left: 21,
            right: 155,
            top: 25,
            bottom: 24,
            child: RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                  text: "Find your best ",
                  style: Styles.textStyle22,
                ),
                const TextSpan(
                  text: "distination with \n",
                  style: Styles.textStyle22,
                ),
                TextSpan(
                  text: "20% ",
                  style: Styles.textStyle22.copyWith(color: Colors.blue),
                ),
                const TextSpan(
                  text: "Off!",
                  style: Styles.textStyle22,
                ),
              ],
            )),
          )
        ]),
      ),
    );
  }
}
