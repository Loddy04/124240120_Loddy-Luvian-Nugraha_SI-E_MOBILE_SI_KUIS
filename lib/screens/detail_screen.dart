import 'package:flutter/material.dart';
import '../models/stationery_item.dart';

class DetailScreen extends StatefulWidget {
  // Menerima data objek FoodItem yang dipilih dari HomeScreen
  final StationeryItem item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Controller untuk membaca dan mengontrol input stock pada TextField
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(
      text: widget.item.stock.toString(),
    );
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  // Mengambil angka porsi dari input secara aman
  int get _enteredQuantity {
    final text = _quantityController.text.trim();
    return int.tryParse(text) ?? 0;
  }

  // // Preview total harga real-time di halaman detail
  // int get _previewTotalPrice => _enteredQuantity * widget.item.price;

  // Simpan perubahan porsi ke objek FoodItem dan kembali ke Beranda
  void _saveOrderAndPop() {
    final int newQuantity = _enteredQuantity;

    if (newQuantity < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Jumlah porsi tidak boleh kurang dari 0'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Mutasi data porsi pada objek asli
    widget.item.stock = newQuantity;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 56, 20, 255),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.item.imageUrl,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 240,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(color: Color.fromARGB(255, 56, 20, 255)),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 240,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name, 
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Input TextField untuk mengubah jumlah stock
                  // TextField(
                  //   controller: _quantityController,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(
                  //       Icons.receipt_long,
                  //       color: Color.fromARGB(255, 78, 0, 245),
                  //     ),
                  //     hintText: 'Pcs',
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.grey.shade400),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.grey.shade400),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Color.fromARGB(255, 78, 0, 245), width: 2.0),
                  //     ),
                  //     contentPadding: const EdgeInsets.symmetric(
                  //       horizontal: 14.0,
                  //       vertical: 12.0,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 18),

                  // Input TextField untuk mengubah jumlah picis
                  TextField(
                    
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.receipt_long,
                        color: const Color.fromARGB(255, 78, 0, 245),
                      ),
                      hintText: 'Masukkan Deskripsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 78, 0, 245),
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Tombol simpan pemesanan
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _saveOrderAndPop,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 78, 0, 245),
                        foregroundColor: Colors.white,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Simpan Pemesanan',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
