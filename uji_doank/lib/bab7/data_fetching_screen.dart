import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import package http

class DataFetchingScreen extends StatefulWidget {
  const DataFetchingScreen({super.key});

  @override
  State<DataFetchingScreen> createState() => _DataFetchingScreenState();
}

class _DataFetchingScreenState extends State<DataFetchingScreen> {
  String _data = 'Belum ada data.';
  bool _loading = false;

  Future<void> fetchData() async {
    setState(() => _loading = true);
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        setState(() {
          _data = response.body; // Simpan body respons ke state
        });
      } else {
        setState(() {
          _data = 'Gagal memuat data: ${response.statusCode}';
        });
        // ignore: avoid_print
        print('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _data = 'Terjadi kesalahan: $e';
      });
      // ignore: avoid_print
      print('Terjadi kesalahan: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengambil Data dari API'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _loading ? null : fetchData, // Panggil fungsi fetchData saat tombol ditekan
                child: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Ambil Data'),
              ),
              const SizedBox(height: 20),
              Text(
                _data,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
