import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    routes: {
      '/second': (context) => const SecondScreenNamed(),
      '/third': (context) => const ThirdScreenNamed(),
    },
  ));
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama (Named Routes)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Pergi ke Halaman Kedua'),
              onPressed: () => Navigator.pushNamed(context, '/second'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Pergi ke Halaman Ketiga'),
              onPressed: () => Navigator.pushNamed(context, '/third'),
            ),
          ],
        ),
      ),
    );
  }
}
class SecondScreenNamed extends StatelessWidget {
  const SecondScreenNamed({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua (Named)'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
class ThirdScreenNamed extends StatelessWidget {
  const ThirdScreenNamed({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Ketiga (Named)'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}