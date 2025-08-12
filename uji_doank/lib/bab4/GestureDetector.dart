import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String _feedback = 'Ketuk gambar!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Detector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () { // Callback ketika gambar diketuk
                setState(() {
                  _feedback = 'Gambar diketuk!';
                });
              },
              onLongPress: () { // Callback ketika gambar ditekan lama
                setState(() {
                  _feedback = 'Gambar ditekan lama!';
                });
              },
              child: Image.network(
                'https://picsum.photos/200', // Contoh gambar dari internet
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _feedback,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: GestureDetectorExample()));
}