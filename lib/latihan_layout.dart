import 'package:flutter/material.dart';

class LatihanLayout extends StatelessWidget {
  const LatihanLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Flutter Ketiga (Layouting)"),
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.home),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(
                    8.0), // Added padding for better spacing
                child: Icon(Icons.account_circle, size: 50),
              ),
              const SizedBox(width: 8), // Added spacing between icon and text
              Expanded(
                // Ensures the Column takes remaining space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Flutter McFlutter',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Experienced App Developer',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('123 Main Street'),
              Text('123-456-789'),
            ],
          ),
          const SizedBox(height: 16),
          // You can add widgets here if needed
          // Example: Row(
          //   children: [Text('Additional Information')],
          // ),
        ],
      ),
    );
  }
}
