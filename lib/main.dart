import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/halaman_riwayat_kehadiran.dart';
import 'providers/layanan_kehadiran.dart';
import 'screens/halaman_kehadiran.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LayananKehadiran()),
      ],
      child: Aplikasi(),
    ),
  );
}

class Aplikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Kehadiran Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HalamanKehadiran(),
    HalamanRiwayatKehadiran(),
  ];

  final List<String> _titles = [
    'Pencatatan Kehadiran Mahasiswa',
    'Riwayat Kehadiran Mahasiswa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow[700],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow[700]),
              child: const Center(
                child: Text(
                  'Menu Presensi Mahasiswa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.yellow),
              title: const Text('Pencatatan Kehadiran'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context); // Tutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.yellow),
              title: const Text('Riwayat Kehadiran'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Tutup Drawer
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
