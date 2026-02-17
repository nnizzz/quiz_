import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/home_scrn.dart';
import 'package:lottie/lottie.dart';

class intross extends StatelessWidget {
  const intross({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 4, 5),
              Color.fromARGB(255, 0, 64, 70),
              Color.fromARGB(255, 0, 130, 145),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/72c0b53d-e892-478c-ad6d-62f08ee68f9b/Vk8uSKtAJz.json',
              height: 250,
            ),

            SizedBox(height: 15),

            Text(
              'Welcome To BrainyBites....',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 18),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homesx()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 165, 185),
                      Color.fromARGB(255, 139, 215, 222),   
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
