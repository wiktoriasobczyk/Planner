import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/common/green_button.dart';
// import 'package:timetable_schedule_app/src/graphqlTest/controller.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';
import 'package:timetable_schedule_app/src/graphql-test/controller/country-controller.dart';
import 'package:timetable_schedule_app/src/graphql-test/model/country.dart';
import 'package:timetable_schedule_app/src/graphql-test/view/graphql_test.dart';

class WeekPlanScreen extends StatefulWidget {
  @override
  _WeekPlanScreenState createState() => _WeekPlanScreenState();
}

class _WeekPlanScreenState extends State<WeekPlanScreen> {
  CountryController ctrl = new CountryController();
  Future<List<Country>> countries;
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
  void initState() {
    super.initState();
    countries = ctrl.getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan tygodnia'),
      ),
      drawer: DrawerApp(),
     body: 
          FutureBuilder(
          future: countries,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text("There was an error: ${snapshot.error}");
                var countries = snapshot.data;
                return ListView.separated(
                  itemCount: countries.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Country message = countries[index];

                    return ListTile(
                      title: Text(message.name),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text('PJ'), 
                      ),
                      subtitle: Text(
                        message.nativeLang,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                );
            }
          },
        ));
 
    // body: Center(
    //   child: ListView.builder(
    //     itemCount: days.length,
    //     scrollDirection: Axis.horizontal,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //           padding: const EdgeInsets.all(5.0),
    //           child: Wrap(alignment: WrapAlignment.center, children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(5.0),
    //                 color: dayColor[index],
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: <Widget>[
    //                   Column(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: <Widget>[
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 8.0),
    //                           child: Container(
    //                             child: Text(
    //                               days[index], // day
    //                               style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 24.0,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           child: Text(
    //                             'Czas trawnia twoich zajęc',
    //                             style: TextStyle(
    //                               color: Colors.white54,
    //                               fontSize: 20.0,
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 8.0),
    //                           child: Container(
    //                               width: 150.0,
    //                               height: 130.0,
    //                               decoration: new BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 color: Colors.white,
    //                               ),
    //                               child: Column(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.center,
    //                                 children: <Widget>[
    //                                   Container(
    //                                     child: Text(
    //                                       hours[index] + ' h',
    //                                       style: TextStyle(
    //                                         fontSize: 30.0,
    //                                         color: Color.fromRGBO(
    //                                             128, 142, 149, 1),
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               )),
    //                         ),

    //                         // DataTable(
    //                         //   columns: [
    //                         //     DataColumn(label: Text('Godzina')),
    //                         //     DataColumn(label: Text('Przedmiot')),
    //                         //     DataColumn(label: Text('Miejsce')),
    //                         //   ],
    //                         //   rows:
    //                         //    [
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('8:00 - 10:00')),
    //                         //       DataCell(Text('Seminarium')),
    //                         //       DataCell(Text('PŁ')),
    //                         //     ]),
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('11:00 - 12:00')),
    //                         //       DataCell(Text('Fizyka')),
    //                         //       DataCell(Text('CTI 102')),
    //                         //     ]),
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('11:00 - 12:00')),
    //                         //       DataCell(Text('Fizyka')),
    //                         //       DataCell(Text('CTI 102')),
    //                         //     ]),
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('11:00 - 12:00')),
    //                         //       DataCell(Text('Fizyka')),
    //                         //       DataCell(Text('CTI 102')),
    //                         //     ]),
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('11:00 - 12:00')),
    //                         //       DataCell(Text('Fizyka')),
    //                         //       DataCell(Text('CTI 102')),
    //                         //     ]),
    //                         //     DataRow(cells: [
    //                         //       DataCell(Text('11:00 - 12:00')),
    //                         //       DataCell(Text('Fizyka')),
    //                         //       DataCell(Text('CTI 102')),
    //                         //     ]),
    //                         //   ],
    //                         // ),
    //                         // //Button
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 3.0),
    //                           child: GreenButton(
    //                             labelText: 'Mockup',
    //                             onPressed: () {
    //                               Navigator.pop(context);
    //                               Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                   builder: (BuildContext context) =>
    //                                       GraphqlTest(),
    //                                 ),
    //                               );
    //                             },
    //                           ),
    //                         )
    //                       ])
    //                 ],
    //               ),
    //             )
    //           ]));
    //     },
    //   ),
    // ),
    // );
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
