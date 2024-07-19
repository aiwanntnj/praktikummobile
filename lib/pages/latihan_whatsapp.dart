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
            title: const Text('WhatsApp'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: 'CHATS'),
                Tab(text: 'STATUS'),
                Tab(text: 'CALLS'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.camera_alt),
              ChatsTab(),
              Icon(Icons.update),
              Icon(Icons.call),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        var chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(chat.foto),
          ),
          title: Text(chat.nama),
          subtitle: Text(chat.pesanText),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(chat.jam),
              Icon(
                chat.status == 'read'
                    ? Icons.done_all
                    : chat.status == 'pending'
                        ? Icons.done
                        : Icons.check,
                color: chat.status == 'read' ? Colors.blue : Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}

class Chats {
  final String foto;
  final String nama;
  final String pesanText;
  final String status; // read, pending, delivered
  final String jam;

  Chats({
    required this.foto,
    required this.nama,
    required this.pesanText,
    required this.status,
    required this.jam,
  });
}

// Data dummy chats
List<Chats> chats = [
  Chats(
    foto: 'build/assets/re.jpg',
    nama: 'Bambang saktiawan',
    pesanText: 'coding menyenang kan bukan?',
    status: 'read',
    jam: '12:00 PM',
  ),
  Chats(
    foto: 'assets/images/user2.JPG',
    nama: 'Evindo Gaming',
    pesanText: 'Tapi Thoriq udah haji umur 2 bulan!!!',
    status: 'pending',
    jam: '11:30 AM',
  ),
  Chats(
    foto: 'assets/images/user3.jpg',
    nama: 'Piankt',
    pesanText: 'ga masalah!',
    status: 'delivered',
    jam: '11:00 AM',
  ),
  // Tambahkan lebih banyak data dummy di sini
  Chats(
    foto: 'assets/images/user4.jpg',
    nama: 'Lutpiskii',
    pesanText: 'tenang ada Piannn (Pinjaman Anda)!',
    status: 'read',
    jam: '10:00 AM',
  ),
  Chats(
    foto: 'assets/images/user5.jpg',
    nama: 'khairul',
    pesanText: 'aku di Mielitan singing with me yaa',
    status: 'pending',
    jam: '9:30 AM',
  ),
  Chats(
    foto: 'assets/images/user6.jpg',
    nama: 'ardhan',
    pesanText: 'jangan bolos bolos rul',
    status: 'delivered',
    jam: '9:00 AM',
  ),
  Chats(
    foto: 'assets/images/user7.jpg',
    nama: 'imam',
    pesanText: 'gilaa kau rul...!',
    status: 'read',
    jam: '8:00 AM',
  ),
  Chats(
    foto: 'assets/images/user8.jpg',
    nama: 'onic',
    pesanText: 'sini bg trial',
    status: 'pending',
    jam: '7:30 AM',
  ),
  Chats(
    foto: 'assets/images/user9.jpg',
    nama: 'PDI',
    pesanText: 'menyalaa!!!',
    status: 'delivered',
    jam: '7:00 AM',
  ),
  Chats(
    foto: 'assets/images/user10.jpg',
    nama: 'Khailaa',
    pesanText: 'i like anything about u rull',
    status: 'read',
    jam: '6:30 AM',
  ),
];
