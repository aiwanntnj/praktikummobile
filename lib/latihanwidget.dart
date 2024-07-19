import 'package:flutter/material.dart';

class LatihanKedua extends StatefulWidget {
  @override
  _LatihanKeduaState createState() => _LatihanKeduaState();
}

class _LatihanKeduaState extends State<LatihanKedua> {
  int nomor = 0;

  void tambahBilangan() {
    setState(() {
      nomor = nomor + 1;
    });
  }

  void kurangiBilangan() {
    setState(() {
      nomor = nomor - 1;
    });
  }

  void deleteBilangan() {
    setState(() {
      nomor = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                nomor.toString(),
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(20.0),
                ),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  'Tambah Bilangan',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: tambahBilangan,
              ),
              SizedBox(height: 10.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.all(20.0),
                ),
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                label: Text(
                  'Kurangi Bilangan',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: kurangiBilangan,
              ),
              SizedBox(height: 10.0),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(20.0),
                ),
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: Text(
                  'Delete Bilangan',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: deleteBilangan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(LatihanKedua());
}
