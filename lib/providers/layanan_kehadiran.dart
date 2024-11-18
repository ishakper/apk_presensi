import 'package:flutter/material.dart';

class Mahasiswa {
  final String nama;
  bool isHadir;

  Mahasiswa({required this.nama, this.isHadir = false});
}

class LayananKehadiran with ChangeNotifier {
  final List<Mahasiswa> _siswa = [
    Mahasiswa(nama: 'Budi'),
    Mahasiswa(nama: 'Ani'),
    Mahasiswa(nama: 'Citra'),
    Mahasiswa(nama: 'Syupik'),
    Mahasiswa(nama: 'Attalurik'),
    Mahasiswa(nama: 'Pablo'),
    Mahasiswa(nama: 'Yanto'),
    Mahasiswa(nama: 'Fauzan'),
    Mahasiswa(nama: 'Caca'),
    Mahasiswa(nama: 'Mega Can'),
    Mahasiswa(nama: 'Dimas Alkohol'),
    Mahasiswa(nama: 'Reza Arab'),
    Mahasiswa(nama: 'Asyep'),
    Mahasiswa(nama: 'Lord Teguh'),
    Mahasiswa(nama: 'Bagus Tri'),
    Mahasiswa(nama: 'Bahrudin'),

  ];

  final List<Map<String, dynamic>> _riwayat = [];

  List<Mahasiswa> get siswa => _siswa;
  List<Map<String, dynamic>> get riwayat => _riwayat;

  void ubahStatusKehadiran(int index) {
    _siswa[index].isHadir = !_siswa[index].isHadir;
    notifyListeners();
  }

  void simpanKehadiran() {
    final hadir = _siswa.where((siswa) => siswa.isHadir).map((siswa) => siswa.nama).toList();
    final tidakHadir = _siswa.where((siswa) => !siswa.isHadir).map((siswa) => siswa.nama).toList();

    _riwayat.add({
      'tanggal': DateTime.now().toString().split(' ')[0],
      'hadir': hadir.length,
      'tidakHadir': tidakHadir.length,
      'mahasiswaHadir': hadir,
      'mahasiswaTidakHadir': tidakHadir,
    });

    notifyListeners();
  }

  void hapusRiwayat(int index) {
    _riwayat.removeAt(index);
    notifyListeners();
  }

  void hapusSemuaRiwayat() {
    _riwayat.clear();
    notifyListeners();
  }
}
