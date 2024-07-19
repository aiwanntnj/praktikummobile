import 'package:flutter/material.dart';
import 'insert.dart';
import 'data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Data customer yang akan ditampilkan di ListView
  // Beri nilai awal berupa list kosong agar tidak error
  // Nantinya akan diisi data dari Shared Preferences
  List<dynamic> savedData = [];

  // Method untuk mengambil data dari Shared Preferences
  Future<void> getSavedData() async {
    final data = await Data.getData();
    setState(() {
      savedData = data;
    });
  }

  // initState ini dipanggil pertama kali oleh Flutter
  @override
  void initState() {
    super.initState();
    // Baca Shared Preferences
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Action tombol ADD untuk proses insert
              // Nilai yang dikirim diisi null
              // Agar di halaman Insert tahu jika null berarti operasi insert data
              // Jika tidak null maka update data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget,
                ),
              ).then((_) {
                // Jika halaman Insert ditutup, ambil kembali Shared Preferences
                // untuk mendapatkan data terbaru dan segera ditampilkan ke user
                // Misal jika ada data customer yang ditambahkan
                getSavedData();
              });
            },
            child: Text(
              'ADD',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: savedData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(savedData[index]['name']),
              subtitle: Text(
                '${savedData[index]['address']} ${savedData[index]['phone']}',
              ),
              contentPadding: EdgeInsets.zero,
              onTap: () {
                // Aksi saat user klik pada item customer pada ListView
                // Nilai diisi selain null menandakan di halaman Insert
                // operasi yang berjalan adalah update atau delete
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Insert(
                      index: index,
                      value: savedData[index],
                    ),
                  ),
                ).then((_) {
                  // Jika halaman Insert ditutup, ambil kembali Shared Preferences
                  // untuk mendapatkan data terbaru dan segera ditampilkan ke user
                  // Misal jika ada data customer yang diedit atau dihapus
                  getSavedData();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
