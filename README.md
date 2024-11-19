## **Praktikum Mobile Development: Aplikasi Presensi Mahasiswa**

### Identitas
**Nama**: Ishak Hadi Pernama  
**NIM**: 362358302072  
**Kelas**: 2A TRPL  

---

### **Hasil Uji Coba**
**Gambar 1: Halaman Pencatatan Kehadiran**  
![Screenshot_1](https://github.com/user-attachments/assets/b30a043e-8ab7-43a1-b3e6-0337591c478d)  

**Gambar 2: Halaman Riwayat Kehadiran**  
![Screenshot_2](https://github.com/user-attachments/assets/3a0001bf-035f-49f7-972b-8ef83b58d35b)  

**Laporan Implementasi:**
Aplikasi ini bertujuan untuk mencatat dan memantau kehadiran siswa dengan beberapa fitur utama:  
1. **Pencatatan Kehadiran Siswa**  
   - Pada halaman ini, daftar siswa ditampilkan dengan opsi untuk menandai mereka hadir atau tidak.  
   - Data kehadiran dapat disimpan menggunakan tombol **Simpan**, yang kemudian akan ditambahkan ke riwayat kehadiran.  

   **Implementasi Utama:**
   - `CheckboxListTile` digunakan untuk mempermudah penandaan kehadiran.  
   - Data kehadiran disimpan ke dalam objek yang diatur melalui `Provider`.

2. **Riwayat Kehadiran Siswa**  
   - Menampilkan catatan kehadiran siswa yang sudah tersimpan, termasuk jumlah siswa yang hadir dan tidak hadir.  
   - Fitur penghapusan individu maupun semua catatan riwayat juga tersedia.  

   **Implementasi Utama:**
   - Menggunakan `ExpansionTile` untuk menyajikan detail data kehadiran (siswa hadir dan tidak hadir).  
   - Tombol hapus data (individu dan semua) memanfaatkan `SnackBar` untuk memberikan umpan balik kepada pengguna.

3. **Navigasi dengan Drawer**  
   - Drawer digunakan untuk berpindah antara **Halaman Kehadiran** dan **Riwayat Kehadiran**.  
   - Ikon dan warna yang digunakan sesuai dengan tema aplikasi, memberikan pengalaman pengguna yang nyaman.

**Fitur Tambahan:**
- **Floating Action Button (FAB)**  
   - Tombol aksi cepat untuk menyimpan kehadiran atau menghapus semua riwayat.  
- **UI Bertema**  
   - Warna kuning dipilih sebagai elemen utama, memberikan kesan ceria dan formal.  

**Struktur Proyek:**
- `main.dart`: Berisi logika navigasi utama dan setup aplikasi.  
- `screens/halaman_kehadiran.dart`: Halaman pencatatan kehadiran siswa.  
- `screens/halaman_riwayat_kehadiran.dart`: Halaman yang menampilkan riwayat kehadiran.  
- `providers/layanan_kehadiran.dart`: Logika utama untuk mengelola data kehadiran dan riwayat.  

**Gambar 3: Halaman Drawer Navigasi**  
![Screenshot_3](https://github.com/user-attachments/assets/9ec888b5-c934-4f14-ba99-e474a46050ac)  

---

