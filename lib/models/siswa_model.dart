/// Model data siswa
class Siswa {
  /// Nama siswa
  String nama;

  /// Status kehadiran siswa (true = hadir, false = tidak hadir)
  bool isHadir;

  Siswa({required this.nama, this.isHadir = false});
}
