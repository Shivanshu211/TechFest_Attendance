import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  final String eventName;

  AttendancePage({required this.eventName});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Map<String, bool> attendance = {
    'Participant 1': false, 'Participant 2': false, 'Participant 3': false,
    'Participant 4': false, 'Participant 5': false, 'Participant 6': false,
    'Participant 7': false, 'Participant 8': false, 'Participant 9': false,
    'Participant 10': false, 'Participant 11': false, 'Participant 12': false,
    'Participant 13': false, 'Participant 14': false, 'Participant 15': false,
    'Participant 16': false, 'Participant 17': false, 'Participant 18': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.eventName} - Attendance'),
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
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          String userName = attendance.keys.elementAt(index);
          return CheckboxListTile(
            title: Text(userName),
            value: attendance[userName],
            onChanged: (bool? value) {
              setState(() {
                attendance[userName] = value ?? false;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadAttendanceSheet(widget.eventName, attendance);
        },
        child: Icon(Icons.download),
      ),
    );
  }

  void downloadAttendanceSheet(String eventName, Map<String, bool> attendance) {
    // Convert the attendance to CSV format
    List<List<String>> csvData = [
      ["User Name", "Present"],
      ...attendance.entries.map((entry) => [
        entry.key,
        entry.value ? "Present" : "Absent",
      ]),
    ];

    // Convert to CSV or Excel format (use relevant packages)
    // Save the file locally or trigger a download
    // Use 'csv' or 'excel' package, and 'path_provider' for saving files.
  }
}
