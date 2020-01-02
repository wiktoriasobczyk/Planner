import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/common/green_button.dart';
// import 'package:timetable_schedule_app/src/graphqlTest/controller.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';
import 'package:timetable_schedule_app/src/graphql-test/controller/country-controller.dart';
import 'package:timetable_schedule_app/src/graphql-test/model/country.dart';
import 'package:timetable_schedule_app/src/graphql-test/view/graphql_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeekPlanScreen extends StatefulWidget {
  @override
  _WeekPlanScreenState createState() => _WeekPlanScreenState();
}

class _WeekPlanScreenState extends State<WeekPlanScreen> {
  CountryController ctrl = new CountryController();
  Future<List<Country>> countries;
  final days = ['Poniedziałek', 'WT', 'ŚR', 'CZW', 'PT', 'SOBOTA', 'NIEDZIELA'];
  int bottomNavBarIndex;
  String selectedDay;
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
    selectedDay = days[0];
    bottomNavBarIndex = 0;
    countries = ctrl.getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      body: CustomScrollView(slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 100.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Plan tygodnia'),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: dayColor[bottomNavBarIndex],
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
                                    days[bottomNavBarIndex], // day
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
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
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
                                            hours[bottomNavBarIndex] + ' h',
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
                            ])
                      ],
                    ),
                  )
                ]))),
        SliverFillRemaining(
          child: FutureBuilder(
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
                  return Material(
                      // color: Colors.grey[300],
                      child: ListView.separated(
                    itemCount: countries.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      Country message = countries[index];
                      return ListTile(
                        title:  Text(message.code+message.name),
                        isThreeLine: true,
                        // leading: CircleAvatar(
                        //   child: Text('11:50 - 12:30'),
                        // ),
                        subtitle: Text(
                          'prowadzący: ' +
                              message.nativeLang +
                              '\nmiejsce:' +
                              message.code,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    },
                  ));
              }
            },
          ),
        )
      ]),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (int index) {
          setState(() {
            bottomNavBarIndex = index;
            // selectedDay = (days[index])
            // zmaiana dla selected
          });
        },
        items: [
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Pn'),
                        ),
              title: Text(days[0], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Wt'),
                        ),
              title: Text(days[1], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Śr'),
                        ),
              title: Text(days[2], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Czw'),
                        ),
              title: Text(days[3], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Pt'),
                        ),
              title: Text(days[4], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Sb'),
                        ),
              title: Text(days[5], style: TextStyle(color: Colors.black))),
          new BottomNavigationBarItem(
              icon:  CircleAvatar(
                          child: Text('Nd'),
                        ),
              title: Text(days[6], style: TextStyle(color: Colors.black))),
        ],
      ),
    );
  }
}
