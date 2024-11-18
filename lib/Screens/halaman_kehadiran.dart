import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/layanan_kehadiran.dart';

class HalamanKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final layananKehadiran = Provider.of<LayananKehadiran>(context);

    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Daftar Kehadiran Mahasiswa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: layananKehadiran.siswa.length,
              itemBuilder: (context, index) {
                final siswa = layananKehadiran.siswa[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CheckboxListTile(
                    title: Text(siswa.nama),
                    value: siswa.isHadir,
                    activeColor: Colors.yellow[700],
                    onChanged: (value) {
                      layananKehadiran.ubahStatusKehadiran(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          layananKehadiran.simpanKehadiran();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kehadiran berhasil disimpan!')),
          );
        },
        child: const Icon(Icons.save, color: Colors.white),
      ),
    );
  }
}
