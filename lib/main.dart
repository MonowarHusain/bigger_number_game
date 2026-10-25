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
        splashFactory: InkRipple.splashFactory,
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

  void resetGame() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Game reset'),
        duration: Duration(seconds: 1),
      ),
    );

    setState(() {
      points = 0;
      rollNumbers();
    });
  }

  void checkAnswer(bool isLeftClicked) {
    final bool isCorrect = isLeftClicked
        ? leftNumber > rightNumber
        : rightNumber > leftNumber;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? 'Correct!' : 'Incorrect!'),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {
      if (isCorrect) {
        points++;
      } else {
        points--;
      }
      rollNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bigger Number Game!'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetGame,
            tooltip: 'Restart Game',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Press the button of the larger number. If you get it right, you will earn a point! If you get it wrong, you will lose a point.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => checkAnswer(true),
                    child: Text('$leftNumber'),
                  ),
                  ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    child: Text('$rightNumber'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Points: $points',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: resetGame,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Restart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
