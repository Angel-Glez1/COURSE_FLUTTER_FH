import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Porgress indicator'),
        ),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text('Circular progress App'),
          SizedBox(
            height: 15,
          ),
          CircularProgressIndicator(
              strokeWidth: 5, backgroundColor: Colors.orange),
          SizedBox(
            height: 15,
          ),
          Text('Circular  y linear indicator controlador'),
          SizedBox(
            height: 15,
          ),
          _ControlledPorgressIndecator()
        ],
      ),
    );
  }
}

class _ControlledPorgressIndecator extends StatelessWidget {
  const _ControlledPorgressIndecator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progessValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircularProgressIndicator(
                value: progessValue,
                strokeWidth: 5,
                backgroundColor: Colors.black12,
              ),

              const SizedBox( width: 20, ),

              Expanded(
                  child: LinearProgressIndicator(
                   value: progessValue,
              )),

            ],
          ),
        );
      },
    );
  }
}
