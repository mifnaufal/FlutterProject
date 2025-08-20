import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Penting: import dart:convert untuk parsing JSON

class JsonParsingScreen extends StatefulWidget {
  const JsonParsingScreen({super.key});

  @override
  State<JsonParsingScreen> createState() => _JsonParsingScreenState();
}

class _JsonParsingScreenState extends State<JsonParsingScreen> {
  String _title = 'Belum ada judul.';
  bool _completed = false;
  bool _isLoading = false; // State untuk indikator loading

  Future<void> fetchTodo() async {
    setState(() {
      _isLoading = true; // Set loading true saat memulai fetch
      _title = 'Memuat data...';
      _completed = false;
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        // Parsing JSON: mengubah string JSON menjadi Map Dart
        final Map<String, dynamic> todo = jsonDecode(response.body);
        setState(() {
          _title = todo['title']; // Akses nilai menggunakan key
          _completed = todo['completed'];
          _isLoading = false; // Set loading false setelah data diterima
        });
      } else {
        setState(() {
          _title = 'Gagal memuat data: ${response.statusCode}';
          _completed = false;
          _isLoading = false;
        });
        // ignore: avoid_print
        print('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _title = 'Terjadi kesalahan: $e';
        _completed = false;
        _isLoading = false;
      });
      // ignore: avoid_print
      print('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parsing JSON Data'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator() // Tampilkan loading indicator
                  : Column(
                      children: [
                        Text(
                          'Judul Todo: $_title',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Selesai: ${_completed ? "Ya" : "Tidak"}',
                          style: TextStyle(
                            fontSize: 18,
                            color: _completed ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : fetchTodo, // Nonaktifkan tombol saat loading
                child: const Text('Ambil Todo Baru'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
