import 'package:flutter/material.dart';

class CounterFuntionsScreen extends StatefulWidget {
  const CounterFuntionsScreen({super.key});

  @override
  State<CounterFuntionsScreen> createState() => _CounterFuntionsScreenState();
}

class _CounterFuntionsScreenState extends State<CounterFuntionsScreen> {
  int clickCounter = 0;

  void increment() {
    setState(() {
      clickCounter++;
    });
  }

  void decrement() {
    setState(() {
      if (clickCounter == 0) return;
      clickCounter;
    });
  }

  void refresh() {
    setState(() {
      clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Funtions'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_outlined),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 140, fontWeight: FontWeight.w100),
              ),
              Text(
                clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPress: refresh,
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.plus_one,
              onPress: increment,
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPress: decrement,
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const CustomButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
