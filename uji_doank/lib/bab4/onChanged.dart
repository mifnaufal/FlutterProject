import 'package:flutter/material.dart';

class OnChangedDemo extends StatefulWidget {
  const OnChangedDemo({super.key});

  @override
  State<OnChangedDemo> createState() => _OnChangedDemoState();
}

class _OnChangedDemoState extends State<OnChangedDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnChanged Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          onChanged: (text) {
            print('Teks berubah menjadi: $text');
          },
          decoration: const InputDecoration(
            labelText: 'Ketik sesuatu',
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: OnChangedDemo()));
}