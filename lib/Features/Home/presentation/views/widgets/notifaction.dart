import 'package:flutter/material.dart';

class Notifaction extends StatelessWidget {
  const Notifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Notifaction",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
         
          children: [
            Image.asset("assets/images_home/notefication.jpg",
            width: 350,
            height: 350,
            ),
            const SizedBox(height: 30,),
            const Text("You don't have any",
                style:TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 10,),
            const Text("notification",
                style:TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )),
            
          ],
        ),
      )
    );
  }
}