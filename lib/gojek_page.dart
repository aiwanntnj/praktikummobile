import 'package:flutter/material.dart';
import 'package:myapp/latihanwidget.dart'; // Pastikan import ini benar

class GejekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gejek Page'),
      ),
      body: Center(
        child:
            LatihanKedua(), // Pastikan LatihanKedua didefinisikan dan diimport dengan benar
      ),
    );
  }
}

class GojekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Image.asset('assets/gojek_logo.png', height: 40),
        actions: [
          Icon(Icons.notifications_none, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GOPAY', style: TextStyle(color: Colors.white)),
                      Text('Rp. 120.000',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.payment, color: Colors.white),
                          Text('Transfer',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.qr_code_scanner, color: Colors.white),
                          Text('Scan QR',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.account_balance_wallet,
                              color: Colors.white),
                          Text('Isi Saldo',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.more_horiz, color: Colors.white),
                          Text('Lainnya',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildMenuItem('GO-RIDE', 'assets/go_ride.png'),
                  _buildMenuItem('GO-CAR', 'assets/go_car.png'),
                  _buildMenuItem('GO-BLUEBIRD', 'assets/go_bluebird.png'),
                  _buildMenuItem('GO-SEND', 'assets/go_send.png'),
                  _buildMenuItem('GO-DEALS', 'assets/go_deals.png'),
                  _buildMenuItem('GO-PULSA', 'assets/go_pulsa.png'),
                  _buildMenuItem('GO-FOOD', 'assets/go_food.png'),
                  _buildMenuItem('MORE', 'assets/more.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String assetPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetPath, height: 50),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
