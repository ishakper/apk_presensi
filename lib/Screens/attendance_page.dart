import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencatatan Kehadiran Mahasiswa Poliwangi'),
      ),
      body: ListView.builder(
        itemCount: provider.students.length,
        itemBuilder: (context, index) {
          final student = provider.students[index];
          return CheckboxListTile(
            title: Text(student.name),
            value: student.isPresent,
            onChanged: (value) {
              provider.toggleAttendance(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.saveAttendance();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kehadiran disimpan!')),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}