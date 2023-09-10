import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated'),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Elevated'),
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.local_airport_rounded),
              label: const Text('Elevated Icon')),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.local_airport_rounded),
              label: const Text('Filled')),
          OutlinedButton(onPressed: () {}, child: const Text('Outline')),
          TextButton(onPressed: () {}, child: const Text('Icon')),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.accessibility_new_outlined),
            label: const Text('Text icon'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
            color: Theme.of(context).colorScheme.primary,
          ),
          const CustomButton(),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Material(
        color: Colors.pinkAccent,
        child:  InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  Text(
                'Hola',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
