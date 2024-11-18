/// Model data siswa
class Student {
  /// Nama siswa
  String name;

  /// Status kehadiran siswa (true = hadir, false = tidak hadir)
  bool isPresent;

  Student({required this.name, this.isPresent=false});
}