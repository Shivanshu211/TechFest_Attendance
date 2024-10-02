import 'package:flutter/material.dart';

import 'EventListPage.dart';

class TechFestOverviewPage extends StatelessWidget {
  final List<String> subEvents = [
    'PLEXUS', 'ELECTRICA', 'FOOD-O-CRATS', 'MECHANICA',
      'CHEMICA','ELECTRONICA','GENESIS', 'KERMIS','ROBOZAR',
        'KARYARACHNA', 'ATOMHEIMER','VENTURE VAULT'
  ];

  final List<String> eventLogos = [
    'assets/images/plexus.png',
    'assets/images/electrica.png',
    'assets/images/food.png',
    'assets/images/mechenica.png',
    'assets/images/chemica.png',
    'assets/images/electronica.png',
    'assets/images/genesis.png',
    'assets/images/kermis.png',
    'assets/images/robozar.png',
    'assets/images/karyarachna.png',
    'assets/images/atomheimer.png',
    'assets/images/venture.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechFest - Domains'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/techFest_logo.png', // Path to the image
              width: 36, // Width of the image
              height: 36, // Height of the image
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: subEvents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(subEvents[index]),
              leading: Image.asset(eventLogos[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventListPage(subEventName: subEvents[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
