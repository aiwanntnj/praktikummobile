import 'package:flutter/material.dart';

class LuasSegitigaApp extends StatefulWidget {
  @override
  _LuasSegitigaAppState createState() => _LuasSegitigaAppState();
}

class _LuasSegitigaAppState extends State<LuasSegitigaApp> {
  final TextEditingController alasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  double luas = 0;

  void hitungLuas() {
    double alas = double.parse(alasController.text);
    double tinggi = double.parse(tinggiController.text);
    setState(() {
      luas = 0.5 * alas * tinggi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Luas Segitiga'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: alasController,
                decoration: InputDecoration(
                  labelText: 'Alas *',
                  icon: Icon(Icons.straighten),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: tinggiController,
                decoration: InputDecoration(
                  labelText: 'Tinggi *',
                  icon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 40.0),
              Text(
                'Luas = $luas',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Corrected the color property
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: hitungLuas,
                child: Text(
                  'HITUNG',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(LuasSegitigaApp());
}
