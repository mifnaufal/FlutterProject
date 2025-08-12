import 'package:flutter/material.dart';

class ButtonInteractionExample extends StatefulWidget {
  const ButtonInteractionExample({super.key});

  @override
  State<ButtonInteractionExample> createState() => _ButtonInteractionExampleState();
}

class _ButtonInteractionExampleState extends State<ButtonInteractionExample> {
  String _message = 'Tekan tombol di bawah!';

  void _updateMessage() {
    setState(() {
      _message = 'Tombol sudah ditekan!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Interaction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateMessage, // Memanggil fungsi _updateMessage saat tombol ditekan
              child: const Text('Tekan Saya'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ButtonInteractionExample()));
}