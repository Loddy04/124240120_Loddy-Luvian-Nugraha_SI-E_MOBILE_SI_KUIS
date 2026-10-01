import 'package:flutter/material.dart';

// Halaman profil pengguna (konten statis menggunakan StatelessWidget)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 0, 245),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Avatar pengguna
            CircleAvatar(
              radius: 55,
              backgroundColor: Color.fromARGB(112, 78, 0, 245),
              child: Icon(
                Icons.person,
                size: 60,
                color: Color.fromARGB(255, 78, 0, 245),
              ),
            ),
            const SizedBox(height: 16),
            // Nama dan NIM mahasiswa
            const Text(
              'Loddy Luvian N',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '124240120',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            // Badge label status pelanggan
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(88, 78, 0, 245),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Pemilik Toko',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 78, 0, 245),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Kartu ringkasan informasi
            _buildInfoCard(
              icon: Icons.store_mall_directory,
              title: 'Toko Alat Tulis',
              subtitle: 'Kelola stok dan harga barang dagangan Anda',
            ),
            _buildInfoCard(
              icon: Icons.list,
              title: 'Barang Unggulan',
              subtitle: 'Pulpen, Buku Tulis, dan Pensil',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk card informasi
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromARGB(96, 78, 0, 245),
            child: Icon(icon, color: Color.fromARGB(255, 78, 0, 245)),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
