import 'package:flutter/material.dart';

// via konstruktor

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Utama (Kirim Data)')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pergi ke Detail Buku'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(
                  title: 'The Hobbit',
                  author: 'J.R.R. Tolkien',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final String title;
  final String author;
  const DetailScreen({super.key, required this.title, required this.author});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Buku')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Judul: $title'),
            Text('Penulis: $author'),
            ElevatedButton(
              child: const Text('Kembali'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}