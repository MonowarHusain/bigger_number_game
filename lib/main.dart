import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const BiggerNumberApp());
}

class BiggerNumberApp extends StatelessWidget {
  const BiggerNumberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bigger Number Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BiggerNumberGameScreen(),
    );
  }
}

class BiggerNumberGameScreen extends StatefulWidget {
  const BiggerNumberGameScreen({super.key});

  @override
  State<BiggerNumberGameScreen> createState() => _BiggerNumberGameScreenState();
}

class _BiggerNumberGameScreenState extends State<BiggerNumberGameScreen> {
  int leftNumber = 0;
  int rightNumber = 0;
  int points = 0;

  @override
  void initState() {
    super.initState();
    rollNumbers();
  }

  void rollNumbers() {
    final random = Random();
    int newLeft;
    int newRight;
    do {
      newLeft = random.nextInt(100) + 1;
      newRight = random.nextInt(100) + 1;
    } while (newLeft == newRight);

    leftNumber = newLeft;
    rightNumber = newRight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    'Bigger Number Game!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Press the button of the larger number. If you get it right, you will earn a point! If you get it wrong, you will lose a point.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('$leftNumber'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('$rightNumber'),
                  ),
                ],
              ),
              Text(
                'Points: $points',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
