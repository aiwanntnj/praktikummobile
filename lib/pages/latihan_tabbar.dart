import 'package:flutter/material.dart';

class LatihanTabBar extends StatelessWidget {
  const LatihanTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(child: Text('All')),
              ],
            ),
            title: const Text('Latihan AppBar'),
          ),
          body: TabBarView(
            children: [
              buildTabContent(Icons.directions_car, 'Mobil'),
              buildTabContent(Icons.directions_train, 'Kereta Api'),
              buildTabContent(Icons.directions_bike, 'Sepeda'),
              buildAllTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabContent(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      child: Column(
        children: [
          Icon(icon, size: 100),
          Text(label, style: const TextStyle(fontSize: 30)),
        ],
      ),
    );
  }

  Widget buildAllTabContent() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var rowTrans = trans[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(rowTrans.foto, size: 70),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rowTrans.nama,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(rowTrans.deskripsi),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (rowTrans.isLike)
                      const Icon(Icons.favorite, color: Colors.red)
                    else
                      Icon(Icons.favorite, color: Colors.grey[300]),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: trans.length,
      ),
    );
  }
}

class Transports {
  final IconData foto;
  final String nama;
  final String deskripsi;
  final bool isLike;

  Transports({
    required this.foto,
    required this.nama,
    required this.deskripsi,
    required this.isLike,
  });
}

// Data Dummy Transport
var trans = [
  Transports(
    foto: Icons.directions_car,
    nama: 'Mobil Sedan',
    deskripsi: 'Kendaraan Roda Empat',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_transit,
    nama: 'Kereta Api',
    deskripsi: 'Angkutan Gerbong dengan Rel',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda Motor',
    deskripsi: 'Kendaraan roda dua pribadi',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Speed Boat',
    deskripsi: 'Perahu Mesin Jet',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Kapal Ferry',
    deskripsi: 'Perahu Besar Mesin Besar',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Sampan Kayu',
    deskripsi: 'Perahu Dayung Apung',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_bus,
    nama: 'Mobil Bus',
    deskripsi: 'Mobil Bus Besar',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda',
    deskripsi: 'Kendaraan roda dua pribadi',
    isLike: false,
  ),
  Transports(
    foto: Icons.shopping_cart,
    nama: 'Troli',
    deskripsi: 'Pengangkutan Barang Sorong',
    isLike: false,
  ),
];
