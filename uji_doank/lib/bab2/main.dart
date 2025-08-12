import 'package:flutter/material.dart';

void main() => runApp(MyBiodataApp());
class MyBiodataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Biodata Saya'),
          backgroundColor: Colors.teal, // warna favorit
        ),
        body: Center(
          child: Text(
            'Nama: Al\nKelas: Flutter Developer',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
