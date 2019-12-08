import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final days = [
    'poniedziałek',
    'wtorek',
    'środa',
    'czwartek',
    'piątek',
    'sobota',
    'niedziela'
  ];
  final hours = ['2', '3', '7', '2', '3', '1', '3'];
  final dayColor = [Colors.green[200], Colors.blueGrey[100],Colors.green[200], Colors.blueGrey[100],Colors.green[200], Colors.blueGrey[100],Colors.green[200], Colors.blueGrey[100]];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan tygodnia'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: screenSize.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: dayColor[index]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  days[index], // day
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Czas trawnia twoich zajęc',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ])
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal, color: new Color(0xffffffff)),
    title: Text(
      rowVal,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
