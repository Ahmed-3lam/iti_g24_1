import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counterText = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterText++;
          print("==================" + counterText.toString());
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterText.toString(),
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
