import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AttendancePage.dart';

class EventListPage extends StatelessWidget {
  final String subEventName;

  // A map of main events with their sub-events
  final Map<String, List<String>> eventsWithSubEvents = {
    'PLEXUS': [
      'Pixel Wizard',
      'AI Chit Chat',
      'Code-o-Soccer',
      'Poster And Paper Presentation',
      'Data Dive'
    ],
    'ELECTRICA': [
      'Poster And Paper Presentation',
      'Touch Vision',
      'Drone X',
      'CircuitMania',
      'Sunsync Quest'
    ],
    'FOOD-O-CRATS': [
      'Food Product Creation & Marketing Competency',
      'Zero Waste Product Formulation',
      'Poster & Paper Presentation',
      'Sustainable Food Trivia',
      'Innovative Product Development'
    ],
    'MECHANICA': [
      'Earthquake Structure Test(EST)',
      'Fabriquer',
      'Designare',
      'TrussLoad',
      'Poster And Paper Presentation',
      'HydraLoad'
    ],
    'CHEMICA': [
      'Jam Session',
      'Application of Lithium Battery',
      'Chemi-Strom',
      'Poster And Paper Presentation',
      'Chemi Mystery',
      'Soap and Perfume Making'
    ],
    'ELECTRONICA': [
      'IOT Challenge',
      'Eco Power',
      'Design Challenge',
      'Poster And Paper Presentation',
      'Wireless hackathon'
    ],
    'GENESIS': [
      'Adhyayan',
      'Udyam',
      'Shuruaat',
      'Virtual Bidding',
      'Poster And Paper Presentation'
    ],
    'KERMIS': ['Satranj', 'Free Fire', 'Battle Royal | BGMI'],
    'ROBOZAR': ['HoverMania', 'Robowar', 'Jarviscup', 'Margdarshak'],
    'KARYARACHNA': ['Hackathon', 'Kritrim - Workong Model'],
    'ATOMHEIMER': [
      'Music Competition',
      'Dance Battle',
      'Drama',
      'Art Exhibition',
      'Stand-up Comedy'
    ],
    'VENTURE VAULT': [
      'Music Competition',
      'Dance Battle',
      'Drama',
      'Art Exhibition',
      'Stand-up Comedy'
    ],
    // Add more subEventNames and corresponding events as needed
  };

  EventListPage({required this.subEventName});

  @override
  Widget build(BuildContext context) {
    // Fetch the relevant sub-events based on the subEventName, or use a default empty list if not found
    List<String> events = eventsWithSubEvents[subEventName] ??
        ['No events available'];

    return Scaffold(
        appBar: AppBar(
          title: Text('$subEventName - Events'),
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
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 6.0),
                // Add spacing around the ListTile
                child: Card( // Wrap ListTile in a Card for elevation and background styling
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Rounded corners for the ListTile
                  ),
                  elevation: 4, // Adds shadow beneath the card
                  child: ListTile(
                    tileColor: Colors.blueGrey.shade900,
                    // Background color for the ListTile
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    // Inner padding for the tile
                    title: Center(
                      child: Text(
                        events[index], // Sub-event name
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18.0, // Text size
                          fontWeight: FontWeight.w600, // Text weight
                        ),
                      ),
                    ),
                    trailing: Icon(
                        Icons.arrow_forward_ios, color: Colors.white),
                    // Add an arrow icon on the right
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AttendancePage(eventName: events[index]),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Rounded corners for the ListTile itself
                    ),
                  ),
                ),
              );
            }));
  }
}
