import 'package:flutter/material.dart';
import '../models/siswa_model.dart';

class LayananKehadiran extends ChangeNotifier {
  List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
    Student(name: 'Reza'),
    Student(name: 'Ishak'),
    Student(name: 'Pablo'),
    Student(name: 'Syupik'),
    Student(name: 'Dhafa Kopling'),
    Student(name: 'Dimas alkohol'),
    Student(name: 'Mega Maharanti'),
  ];

  List<Map<String, dynamic>> _history = [];

  List<Student> get students => _students;
  List<Map<String, dynamic>> get history => _history;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    int present = _students.where((student) => student.isPresent).length;
    int absent = _students.length - present;

    _history.insert(0, {
      'date': DateTime.now().toString(),
      'present': present,
      'absent': absent,
    });

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
