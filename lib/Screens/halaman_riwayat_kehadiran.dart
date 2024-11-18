import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/layanan_kehadiran.dart';

class HalamanRiwayatKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final layananKehadiran = context.watch<LayananKehadiran>();
    final riwayat = layananKehadiran.riwayat;

    return Scaffold(
      body: riwayat.isNotEmpty
          ? ListView.builder(
              itemCount: riwayat.length,
              itemBuilder: (context, index) {
                final catatan = riwayat[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.yellow[100],
                  child: ExpansionTile(
                    title: Text('Tanggal: ${catatan['tanggal']}'),
                    subtitle: Text(
                      'Hadir: ${catatan['hadir']} | Tidak Hadir: ${catatan['tidakHadir']}',
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Daftar Mahasiswa Hadir:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ...catatan['mahasiswaHadir'].map<Widget>((nama) {
                              return Text('- $nama');
                            }).toList(),
                            const SizedBox(height: 10),
                            const Text(
                              'Daftar Mahasiswa Tidak Hadir:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            ...catatan['mahasiswaTidakHadir'].map<Widget>((nama) {
                              return Text('- $nama');
                            }).toList(),
                          ],
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              layananKehadiran.hapusRiwayat(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data berhasil dihapus!'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                            label: const Text('Hapus', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'Belum ada data kehadiran.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
      floatingActionButton: riwayat.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                layananKehadiran.hapusSemuaRiwayat();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Semua data berhasil dihapus!')),
                );
              },
              child: const Icon(Icons.delete_forever, color: Colors.white),
            )
          : null,
    );
  }
}
