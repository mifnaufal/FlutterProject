import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model data untuk Post
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor untuk membuat Post dari JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  // Deklarasikan Future di sini, agar tidak dipanggil berulang kali saat setState
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts(); // Inisialisasi Future saat widget pertama kali dibuat
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        // Jika server mengembalikan respons 200 OK, parse JSON
        final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
        return jsonList
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        // Jika respons tidak 200 OK, lempar exception
        throw Exception('Gagal memuat posts (status: ${response.statusCode})');
      }
    } catch (e) {
      // Propagasikan kesalahan agar FutureBuilder dapat menanganinya
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Posts'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture, // Future yang akan dipantau
        builder: (context, snapshot) {
          // snapshot berisi status dan data dari Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilkan loading indicator saat menunggu
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Tampilkan pesan error jika ada
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Error: ${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _postsFuture = fetchPosts();
                        });
                      },
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            if (posts.isEmpty) {
              return const Center(child: Text('Tidak ada data tersedia.'));
            }
            // Jika data tersedia, tampilkan dalam ListView
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(child: Text('${post.id}')),
                  ),
                );
              },
            );
          } else {
            // Kondisi default jika tidak ada data
            return const Center(child: Text('Tidak ada data tersedia.'));
          }
        },
      ),
    );
  }
}
