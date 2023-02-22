import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Attendee {
  final String name;
  bool isPresent;

  Attendee({required this.name, this.isPresent = false});
}

class AttendancePage extends StatefulWidget {
  final List<Attendee> attendees;

  // ignore: prefer_const_constructors_in_immutables
  AttendancePage({super.key, required this.attendees});

  @override
  // ignore: library_private_types_in_public_api
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String _selectedClass = 'Select Class';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: widget.attendees.length,
        itemBuilder: (BuildContext context, int index) {
          final attendee = widget.attendees[index];

          return CheckboxListTile(
            title: Text(attendee.name),
            value: attendee.isPresent,
            onChanged: (bool? value) {
              setState(() {
                attendee.isPresent = value ?? false;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = '';

          for (var attendee in widget.attendees) {
            if (attendee.isPresent) {
              message += '${attendee.name} is present\n';
            } else {
              // message += '${attendee.name} is absent\n';
            }
          }

          final now = DateTime.now();
          final date = '${now.year}-${now.month}-${now.day}';
          final time = '${now.hour}:${now.minute}';
          message =
              'Class: $_selectedClass\nDate: $date\nTime: $time\n\n$message';

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Attendance'),
                content: SelectableText(message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: message));
                      Navigator.of(context).pop();
                    },
                    child: Text('Copy to Clipboard'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.send),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: DropdownButton<String>(
            value: _selectedClass,
            onChanged: (String? value) {
              setState(() {
                _selectedClass = value ?? 'noclassselected';
                if (_selectedClass == 'Select Class') {
                  _selectedClass = 'Select Class';
                }
              });
            },
            items: [
              'Select Class',
              'Software Engineering',
              'IOT',
              'Game Theory',
              'CNS',
              'Compiler Design',
              'MEFA',
            ]
                .map((String className) => DropdownMenuItem<String>(
                      value: className,
                      child: Text(className),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

void main() {
  List<Attendee> attendees = [
    Attendee(name: '120cs0001'),
    Attendee(name: '120cs0002'),
    Attendee(name: '120cs0003'),
    Attendee(name: '120cs0004'),
    Attendee(name: '120cs0005'),
    Attendee(name: '120cs0006'),
    Attendee(name: '120cs0007'),
    Attendee(name: '120cs0008'),
    Attendee(name: '120cs0009'),
    Attendee(name: '120cs0010'),
    Attendee(name: '120cs0011'),
    Attendee(name: '120cs0012'),
    Attendee(name: '120cs0013'),
    Attendee(name: '120cs0014'),
    Attendee(name: '120cs0015'),
    Attendee(name: '120cs0016'),
    Attendee(name: '120cs0017'),
    Attendee(name: '120cs0018'),
    Attendee(name: '120cs0019'),
    Attendee(name: '120cs0020'),
    Attendee(name: '120cs0021'),
    Attendee(name: '120cs0022'),
    Attendee(name: '120cs0023'),
    Attendee(name: '120cs0024'),
    Attendee(name: '120cs0025'),
    Attendee(name: '120cs0026'),
    Attendee(name: '120cs0027'),
    Attendee(name: '120cs0028'),
    Attendee(name: '120cs0029'),
    Attendee(name: '120cs0030'),
    Attendee(name: '120cs0031'),
    Attendee(name: '120cs0032'),
    Attendee(name: '120cs0033'),
    Attendee(name: '120cs0034'),
    Attendee(name: '120cs0035'),
    Attendee(name: '120cs0036'),
    Attendee(name: '120cs0037'),
    Attendee(name: '120cs0038'),
  ];

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AttendancePage(attendees: attendees),
  ));
}
