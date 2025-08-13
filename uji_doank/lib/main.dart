import 'package:flutter/material.dart';
import 'bab4/onChanged.dart' as onChangedExample;
import 'bab4/GestureDetector.dart' as gestureExample;
import 'bab4/InputdariPengguna.dart' as userInputExample;
import 'bab4/MengelolaStateLokal.dart' as stateExample;
import 'bab3/latihan/bab3.dart' as bab3Example;
import 'bab4/latihan/bab4.dart' as bab4Example;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Contoh:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const onChangedExample.OnChangedDemo(),
                  ),
                );
              },
              child: const Text('OnChanged Example'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const gestureExample.GestureDetectorExample(),
                  ),
                );
              },
              child: const Text('Gesture Detector Example'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const userInputExample.UserInputExample(),
                  ),
                );
              },
              child: const Text('User Input Example'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const stateExample.CounterApp(),
                  ),
                );
              },
              child: const Text('State Management Example'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const bab3Example.MyProfileCard(),
                  ),
                );
              },
              child: const Text('Bab 3 Profile Card'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const bab4Example.SimpleCalculatorApp(),
                  ),
                );
              },
              child: const Text('Bab 4 Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}