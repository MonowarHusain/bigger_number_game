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

class BiggerNumberGameScreen extends StatelessWidget {
  const BiggerNumberGameScreen({super.key});

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
                    child: const Text('0'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('0'),
                  ),
                ],
              ),
              const Text(
                'Points: 0',
                style: TextStyle(
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
