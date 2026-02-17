import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/home_scrn.dart';
import 'package:flutter_application_1/quizapp/levels_scrn.dart';

class resultxx extends StatelessWidget {
  final int total;
  final int correct;

  const resultxx({
    super.key,
    required this.total,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    final int wrong = total - correct;
    final int score = correct * 10;
    final int completion = ((correct / total) * 100).round();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 43, 48),
              Color.fromARGB(255, 0, 22, 26),
              Color.fromARGB(255, 0, 4, 5),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon:  Icon(Icons.arrow_back_outlined,
                      color: Colors.white),
                ),
              ),

             SizedBox(height: 10),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('Your Score',
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text("$score",
                          style:  TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 30),

              Container(
                height: 160,
                margin:  EdgeInsets.symmetric(horizontal: 20),
                padding:  EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        statItem(
                            completion.toString() + "%",
                            "Completion",
                             Color.fromARGB(255, 0, 22, 26)),
                        statItem(
                            correct.toString(),
                            "Right",
                            Colors.green),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        statItem(
                            total.toString(),
                            "Total Questions",
                             Color.fromARGB(255, 0, 22, 26)),
                        statItem(
                            wrong.toString(),
                            "Wrong",
                            Colors.red),
                      ],
                    ),
                  ],
                ),
              ),

               SizedBox(height: 40),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 220,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => levelsx()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 103, 237, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                    child:  Text('Unlock Next Level',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color:
                            Color.fromARGB(255, 0, 22, 26),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

     
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Color.fromARGB(255, 0, 22, 26),
        currentIndex: 2,
        selectedItemColor: Color.fromARGB(255, 103, 237, 255),
        unselectedItemColor: Color.fromARGB(255, 140, 180, 185),
        items: [
           BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homesx()),
                );
              }, icon: Icon(Icons.home_rounded),
            ),
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
              onPressed: () {},
              icon: Icon(Icons.bar_chart_rounded),
            ),
            label: 'Score',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
           BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_rounded),
            ),label: 'Account',
            backgroundColor: Color.fromARGB(255, 0, 22, 26),
          ),
        ]
      ),
    );
  }

  Widget statItem(String value, String label, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, size: 13, color: color),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style:  TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
