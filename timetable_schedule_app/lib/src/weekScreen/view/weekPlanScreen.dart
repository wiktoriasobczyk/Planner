import 'package:flutter/material.dart';
// import 'package:timetable_schedule_app/src/graphqlTest/controller.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';

class WeekPlanScreen extends StatefulWidget {
  @override
  _WeekPlanScreenState createState() => _WeekPlanScreenState();
}

class _WeekPlanScreenState extends State<WeekPlanScreen> {
  final days = [
    'PONIEDZIAŁEK',
    'WTOREK',
    'ŚRODA',
    'CZWARTEK',
    'PIĄTEK',
    'SOBOTA',
    'NIEDZIELA'
  ];
  final hours = ['2', '3', '7', '2', '3', '1', '3'];
  final dayColor = [
    Colors.green[200],
    Colors.blueGrey[100],
    Colors.green[200],
    Colors.blueGrey[100],
    Colors.green[200],
    Colors.blueGrey[100],
    Colors.green[200],
    Colors.blueGrey[100]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan tygodnia'),
      ),
      drawer: DrawerApp(),
      body: Center(
        child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: dayColor[index],
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            hours[index] + ' h',
                                            style: TextStyle(
                                              fontSize: 30.0,
                                              color: Color.fromRGBO(
                                                  128, 142, 149, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              DataTable(
                                columns: [
                                  DataColumn(label: Text('Godzina')),
                                  DataColumn(label: Text('Przedmiot')),
                                  DataColumn(label: Text('Miejsce')),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(Text('8:00 - 10:00')),
                                    DataCell(Text('Seminarium')),
                                    DataCell(Text('PŁ')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('11:00 - 12:00')),
                                    DataCell(Text('Fizyka')),
                                    DataCell(Text('CTI 102')),
                                  ]),

                                  DataRow(cells: [
                                    DataCell(Text('11:00 - 12:00')),
                                    DataCell(Text('Fizyka')),
                                    DataCell(Text('CTI 102')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('11:00 - 12:00')),
                                    DataCell(Text('Fizyka')),
                                    DataCell(Text('CTI 102')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('11:00 - 12:00')),
                                    DataCell(Text('Fizyka')),
                                    DataCell(Text('CTI 102')),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text('11:00 - 12:00')),
                                    DataCell(Text('Fizyka')),
                                    DataCell(Text('CTI 102')),
                                  ]),
                                ],
                              ),
                              //Button
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text(
                                  'Mockup danych',
                                  style: TextStyle(
                                    color: new Color(0xff6200ee),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => WeekPlanScreen(),
                                  ));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                            ])
                      ],
                    ),
                  )
                ]));
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
