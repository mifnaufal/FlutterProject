import 'package:flutter/material.dart';

// (Data dummy yang sudah disiapkan di langkah 2)
// Tambahkan data dummy agar `photos` terdefinisi dan GridView memiliki sumber data.
const List<Map<String, String>> photos = [
  {
    'title': 'Pemandangan 1',
    'url': 'https://picsum.photos/id/1015/600/400',
  },
  {
    'title': 'Pemandangan 2',
    'url': 'https://picsum.photos/id/1025/600/400',
  },
  {
    'title': 'Pemandangan 3',
    'url': 'https://picsum.photos/id/1035/600/400',
  },
  {
    'title': 'Pemandangan 4',
    'url': 'https://picsum.photos/id/1045/600/400',
  },
  {
    'title': 'Pemandangan 5',
    'url': 'https://picsum.photos/id/1055/600/400',
  },
  {
    'title': 'Pemandangan 6',
    'url': 'https://picsum.photos/id/1065/600/400',
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GalleryApp(),
    );
  }
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery App'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Atur jumlah kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          final photo = photos[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetailScreen(
                    title: photo['title']!,
                    imageUrl: photo['url']!,
                  ),
                ),
              );
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  photo['title']!,
                  textAlign: TextAlign.center,
                ),
              ),
              child: Image.network(
                photo['url']!,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Letakkan class ini di bawah class GalleryApp
class PhotoDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const PhotoDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Tombol "Kembali"
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}