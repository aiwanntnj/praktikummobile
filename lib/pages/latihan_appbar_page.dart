import 'package:flutter/material.dart';

final SnackBar snackBar = const SnackBar(
  content: Text('Ini pesan info dengan Snackbar'),
);

class LatihanAppBarPage extends StatelessWidget {
  LatihanAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan AppBar'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              openPage(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}
