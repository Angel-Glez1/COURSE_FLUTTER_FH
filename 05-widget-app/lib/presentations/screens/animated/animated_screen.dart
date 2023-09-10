import 'dart:math';
import 'package:flutter/material.dart';


class AnimatedScreen extends StatefulWidget {

  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 200;
  double heigth = 200;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void chageChap (){
    final random = Random();
    width = random.nextInt(300) + 120;
    heigth = random.nextInt(300) + 120; 
    borderRadius = random.nextInt(300) + 20;
    color = Color.fromRGBO(
      random.nextInt(255), 
      random.nextInt(255), 
      random.nextInt(255), 
      1
    );
    setState(() {});
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width <= 0 ? 0 : width,
          height: heigth,
          decoration: BoxDecoration( 
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: chageChap,
        child: const Icon(Icons.play_arrow_outlined),
      ),

    );
  }
}