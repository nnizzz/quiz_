import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/quizapp/result_scrn.dart';

class questxx extends StatefulWidget {
  const questxx({super.key});

  @override
  State<questxx> createState() => _questxxState();
}

class _questxxState extends State<questxx> {
  int index = 0;
  String selectedOption = 'None';
  int correctAnswers = 0;

  int secondsRemaining = 10;
  Timer? timer;

  final List<Map<String, dynamic>> quizData = [
    {
      'question': 'Which is the largest planet in our solar system?',
      'options': ['Earth', 'Jupiter', 'Mars', 'Venus'],
      'answer': 'Jupiter',
    },
    {
      'question': 'What is the capital of Australia?',
      'options': ['Sydney', 'Canberra', 'Melbourne', 'Perth'],
      'answer': 'Canberra',
    },
    {
      'question': 'Who wrote the national anthem of India?',
      'options': ['Rabindranath Tagore', 'Bankim Chandra', 'Gandhi', 'Nehru'],
      'answer': 'Rabindranath Tagore',
    },
    {
      'question': 'What is the chemical symbol for Gold?',
      'options': ['Au', 'Ag', 'Fe', 'Go'],
      'answer': 'Au',
    },
    {
      'question': 'Which ocean is the largest in the world?',
      'options': ['Indian', 'Pacific', 'Atlantic', 'Arctic'],
      'answer': 'Pacific',
    },
    {
      'question': 'Who is known as the “Father of the Nation” in India?',
      'options': ['Mahatma Gandhi', 'Nehru', 'Subhash Bose', 'Ambedkar'],
      'answer': 'Mahatma Gandhi',
    },
    {
      'question': 'How many continents are there on Earth?',
      'options': ['5', '6', '7', '8'],
      'answer': '7',
    },
    {
      'question': 'Which gas do plants absorb from the atmosphere?',
      'options': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      'answer': 'Carbon Dioxide',
    },
    {
      'question': 'What is the hardest natural substance on Earth?',
      'options': ['Diamond', 'Iron', 'Gold', 'Granite'],
      'answer': 'Diamond',
    },
    {
      'question': 'Which country is called the “Land of the Rising Sun”?',
      'options': ['China', 'South Korea', 'Japan', 'Thailand'],
      'answer': 'Japan',
    },
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    secondsRemaining = 10;

    timer?.cancel();
    timer = Timer.periodic( Duration(seconds: 1), (Timer t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        t.cancel();
        nextQuestion();
      }
    });
  }

  void nextQuestion() {
    timer?.cancel();

    if (selectedOption == quizData[index]['answer']) {
      correctAnswers++;
    }

    if (index < quizData.length - 1) {
      setState(() {
        index++;
        selectedOption = 'None';
      });
      startTimer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              resultxx(total: quizData.length, correct: correctAnswers),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
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
            padding:  EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (index > 0) {
                          timer?.cancel();
                          setState(() {
                            index--;
                            selectedOption = 'None';
                          });
                          startTimer();
                        }
                      },
                      child:  Text(
                        "Previous",
                        style: TextStyle(
                          color: Color.fromARGB(255, 180, 210, 215),
                        ),
                      ),
                    ),
                    Text(
                      '${index + 1}/${quizData.length}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 240, 253, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (index < quizData.length - 1) {
                          timer?.cancel();
                          setState(() {
                            index++;
                            selectedOption = 'None';
                          });
                          startTimer();
                        }
                      },
                      child:  Text(
                        "Skip",
                        style: TextStyle(
                          color: Color.fromARGB(255, 180, 210, 215),
                        ),
                      ),
                    ),
                  ],
                ),

                 SizedBox(height: 20),

                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 240, 253, 255).withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(
                        Icons.timer,
                        color: Color.fromARGB(255, 240, 253, 255),
                      ),
                      Text(
                        '$secondsRemaining Secs',
                        style:  TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 240, 253, 255),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  quizData[index]['question'],
                  style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 240, 253, 255),
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 25),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: quizData[index]['options'].length,
                  itemBuilder: (context, optIndex) {
                    final option = quizData[index]['options'][optIndex];

                    return Container(
                      margin:  EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color:  Color.fromARGB(255, 0, 64, 70),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RadioListTile(
                        title: Text(
                          option,
                          style:  TextStyle(
                            color: Color.fromARGB(255, 240, 253, 255),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: option,
                        groupValue: selectedOption,
                        activeColor:
                             Color.fromARGB(255, 103, 237, 255),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 200, 220),
                    padding:  EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    index < quizData.length - 1 ? "Next" : "Submit",
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 4, 5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
