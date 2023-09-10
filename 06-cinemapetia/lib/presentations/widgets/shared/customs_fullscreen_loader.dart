import 'package:flutter/material.dart';



class CustomFullScreenLoader extends StatelessWidget {
  const CustomFullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            CircularProgressIndicator(strokeWidth: 5,)
        ],
      ),
    );
  }
}