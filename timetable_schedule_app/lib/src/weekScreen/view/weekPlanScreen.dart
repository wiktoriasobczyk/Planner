import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/common/green_button.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';
import 'package:timetable_schedule_app/src/graphql-test/controller/country-controller.dart';
import 'package:timetable_schedule_app/src/graphql-test/model/country.dart';
import 'package:timetable_schedule_app/src/weekScreen/view.dart';

class WeekPlanScreen extends StatefulWidget {
  @override
  _WeekPlanScreenState createState() => _WeekPlanScreenState();
}

class _WeekPlanScreenState extends State<WeekPlanScreen> {
  CountryController ctrl = new CountryController();
  Future<List<Country>> countries;
  final days = ['Pn', 'Wt', 'Śr', 'Czw', 'Pt', 'Sb', 'Nd'];

  int bottomNavBarIndex;
  Color selectedTextColor = Colors.green;
  List<Color> itemColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color> textColor = [
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green
  ];

  String selectedDay;

  final dayColor = [Colors.white, Colors.green];

  @override
  void initState() {
    super.initState();
    selectedDay = days[0];
    bottomNavBarIndex = 0;
    countries = ctrl.getCountriesList();
  }

  ListTile myRowDataIcon(Icon icon, String rowVal) {
    return ListTile(
      leading: icon,
      title: Text(
        rowVal,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  _onButtonPressed(Country mesage) {
    print('xd');
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Text('Szczegóły'),
              myRowDataIcon(null, mesage.name),
              myRowDataIcon(
                  Icon(FontAwesomeIcons.timesCircle), '12.30 - 14.30'),
              myRowDataIcon(Icon(FontAwesomeIcons.calendar), '12.08.2020'),
              myRowDataIcon(Icon(FontAwesomeIcons.peopleCarry), mesage.nativeLang),
              myRowDataIcon(null, 'Details: x1, x2  '+ mesage.phone),
              RaisedButton(
                  child: Text('Edytuj'),
                  textColor: Colors.white,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                  onPressed: () => {print('test')}),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      body: CustomScrollView(slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 10.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Plan tygodnia (TYTUŁ)'),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Wrap(alignment: WrapAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      // color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Container(
                                  child: Text(
                                    days[bottomNavBarIndex], // day
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
                      child: ListView.separated(
                    itemCount: countries.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      Country message = countries[index];
                      return ListTile(
                        title: Text('12:30 - 15:00   ' + message.name),
                        isThreeLine: true,
                        subtitle: Text(
                          'prowadzący: ' +
                              message.nativeLang +
                              '\nmiejsce: ' +
                              message.code,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => _onButtonPressed(countries[index]),
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
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            bottomNavBarIndex = index;
            // selectedDay = (days[index])
            // zmaiana dla selected
          });
        },
        items: [
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[0], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[1], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[2], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[3], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[4], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text('Sb', style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[6], style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
