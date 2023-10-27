import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Назад'))
          ],
        ),
      ),
    );
  }
}
