import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/levels_scrn.dart';
import 'package:flutter_application_1/quizapp/result_scrn.dart';

class homesx extends StatelessWidget {
  const homesx({super.key});

  @override
  Widget build(BuildContext context) {
    final List names = [
      'General Knowledge',
      'Science',
      'Maths',
      'Space',
      'History',
      'Sports',
      'Geography',
      'Logical Reasoning',
      'Current Affairs',
      'Children',
    ];
    final List icons = [
      Icons.public_rounded,
      Icons.science_rounded,
      Icons.calculate_rounded,
      Icons.rocket_launch_rounded,
      Icons.history_edu_rounded,
      Icons.sports_basketball_rounded,
      Icons.landscape_rounded,
      Icons.quiz_rounded,
      Icons.newspaper_rounded,
      Icons.child_care_rounded,
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 43, 48),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color.fromARGB(255, 0, 4, 5),
              // Color.fromARGB(255, 0, 64, 70),
              // Color.fromARGB(255, 0, 130, 145)
              Color.fromARGB(255, 0, 43, 48),
              Color.fromARGB(255, 0, 22, 26),
              Color.fromARGB(255, 0, 4, 5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome!!!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 253, 255),
                      ),
                    ),
                    SizedBox(height: 8),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromARGB(255, 0, 130, 145),
                      foregroundColor: Color.fromARGB(255, 240, 253, 255),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person_rounded),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                TextField(
                  style: TextStyle(
                    backgroundColor: Color.fromARGB(255, 0, 64, 70),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search quiz categories here....',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 170, 205, 210),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 0, 64, 70),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Color.fromARGB(255, 103, 237, 255),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 130, 145),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore All Categories.....',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 240, 253, 255),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                Expanded(
                  child: GridView.builder(
                    itemCount: names.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => levelsx()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 0, 64, 70),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index],
                                  color: Color.fromARGB(255, 0, 200, 220),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  names[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 240, 253, 255),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 0, 22, 26),
        currentIndex: 0,
        selectedItemColor: Color.fromARGB(255, 103, 237, 255),
        unselectedItemColor: Color.fromARGB(255, 140, 180, 185),
        items: [
          BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.home_rounded)),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view_rounded),
            ),
            label: 'Categories',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => resultxx(
                    total: 10,
                    correct: 0,
                  )),
                );
              },
              icon: Icon(Icons.bar_chart_rounded),
            ),
            label: 'Score',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_rounded),
            ),
            label: 'Account',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
        ],
      ),
    );
  }
}
