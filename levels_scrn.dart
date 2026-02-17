import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/home_scrn.dart';
import 'package:flutter_application_1/quizapp/qstions_scrn.dart';

class levelsx extends StatelessWidget {
  const levelsx({super.key});

  @override
  Widget build(BuildContext context) {
    final List level = ['Beginner', 'Intermediate', 'Advanced'];
    final List sub = ['Level 1', 'Level 2', 'Level 3'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 47, 53),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homesx()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 158, 234, 243),
          ),
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        title: Text(
          "Let's Start....",
          style: TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 240, 253, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Color.fromARGB(255, 158, 234, 243),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_2_outlined,
              color: Color.fromARGB(255, 158, 234, 243),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: level.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => questxx()),
              );
            },
            child: Container(
              height: 140,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 111, 120),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sub[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 182, 243, 250),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          level[index],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 241, 254, 255),
                          ),
                        ),
                      ],
                    ),

                    Spacer(),
                    Icon(
                      Icons.play_circle_fill,
                      size: 42,
                      color: Color.fromARGB(255, 1, 43, 47),
                    ),
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
