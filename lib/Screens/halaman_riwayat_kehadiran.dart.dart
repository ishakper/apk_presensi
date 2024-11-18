import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/layanan_kehadiran.dart';

class HalamanRiwayatKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = context.watch<LayananKehadiran>().history;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran Mahasiswa Poliwangi')),
      body: history.isNotEmpty
          ? ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final record = history[index];
                return ListTile(
                  title: Text('Tanggal: ${record['date']}'),
                  subtitle: Text(
                    'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
                  ),
                );
              },
            )
          : const Center(
              child: Text('Belum ada data kehadiran.'),
            ),
    );
  }
}
