import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileCard());
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200], // warna latar belakang layar
        body: Center(
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min, // biar tinggi menyesuaikan
                children: [
                  // Foto profil
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300',
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Nama lengkap
                  const Text(
                    'Baihaqi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Profesi
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Ikon media sosial
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.facebook, color: Colors.blue, size: 30),
                      SizedBox(width: 20),
                      Icon(Icons.camera_alt, color: Colors.purple, size: 30),
                      SizedBox(width: 20),
                      Icon(Icons.work, color: Colors.black, size: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
