import 'package:flutter/material.dart';

// ✅ Data dummy foto untuk GridView
const List<Map<String, String>> photos = [
  {'title': 'Gunung', 'url': 'https://picsum.photos/id/1018/400/400'},
  {'title': 'Pantai', 'url': 'https://picsum.photos/id/1015/400/400'},
  {'title': 'Hutan',  'url': 'https://picsum.photos/id/1020/400/400'},
  {'title': 'Kota',   'url': 'https://picsum.photos/id/1011/400/400'},
  {'title': 'Danau',  'url': 'https://picsum.photos/id/1003/400/400'},
  {'title': 'Jalan',  'url': 'https://picsum.photos/id/1035/400/400'},
];

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Gallery App')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length, // ✅ sudah terdefinisi
        itemBuilder: (BuildContext context, int index) {
          final photo = photos[index]; // ✅ tidak merah lagi
          return GestureDetector(
            onTap: () {
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
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, fit: BoxFit.contain),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
