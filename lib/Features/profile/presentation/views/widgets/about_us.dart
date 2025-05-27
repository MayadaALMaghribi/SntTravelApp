import 'package:flutter/material.dart';
import 'package:sntegpito/core/utils/styles.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 191, 224, 236),
        elevation: 0,
        title: Text(
          "About US",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/Splash.png", height: 100),
                  SizedBox(height: 10),
                  Text(
                    "SNT - Explore Egypt",
                    style: Styles.textstyle18,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "SNT It aims to help you explore the country in a simple and engaging way by introducing you to the different types of tourism available — including historical, cultural, medical, religious, and beach tourism..",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "🌍 Our Mission",
              style: Styles.textstyle18,
            ),
            Text(
              "To promote tourism in Egypt by providing a smart, interactive, and user-friendly experience.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "✨ Features",
              style: Styles.textstyle18,
            ),
            BulletPoint(text: "Learn about top destinations across Egypt."),
            BulletPoint(
                text: "Book hotels that suit your budget and preferences"),
            BulletPoint(
                text: "Enjoy the beautiful beaches and plan seaside trips"),
            BulletPoint(
                text:
                    "Organize your own trip whether you already have a hotel reservation or not"),
            BulletPoint(
                text:
                    "With SNT, your travel experience becomes easier, smarter, and more enjoyable — all in one place"),
            SizedBox(height: 20),
            Text(
              "👩‍💻 About the Team ",
              style: Styles.textstyle18,
            ),
            Text(
              "This application was developed by a dedicated team of students from the Faculty of Science – Ain Shams University.\n\n"
              "The team aimed to create an innovative and helpful tool that promotes tourism in Egypt and enhances the travel experience for users through technology.\n\n"
              "We hope this app becomes your trusted companion as you explore the beauty and culture of Egypt.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "📞 Contact Us",
              style: Styles.textstyle18,
            ),
            Text("Email: support@sntapp.com"),
            Text("Instagram: @sntapp"),
            Text("Facebook: fb.com/sntapp"),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.teal),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}
