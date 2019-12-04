import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/graphqlTest/controller.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.deepPurple],
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Text(
                                'Poniedziałek',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          //subText
                          Container(
                            child: Text(
                              'Czas trawnia twoich zajęc',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          //Circle Avatar
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 150.0,
                                height: 130.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        '9 h',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: Color(0xff8d70fe),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('Godzina'),
                              ),
                              DataColumn(
                                label: Text('Przedmiot'),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(
                                      FontAwesomeIcons.database, "Databases"),
                                ),
                                DataCell(
                                  Text(
                                    '30GB',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(Text('12:00 - 12:30')),
                                DataCell(
                                  Text(
                                    '50',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  myRowDataIcon(FontAwesomeIcons.folderOpen,
                                      "Adons Domain"),
                                ),
                                DataCell(
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Choose Plan',
                                  style: TextStyle(
                                    color: new Color(0xff6200ee),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => Wrapper(),
                                  ));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
