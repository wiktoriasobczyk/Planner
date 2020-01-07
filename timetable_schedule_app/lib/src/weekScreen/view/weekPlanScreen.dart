import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/drawer/view.dart';
import 'package:timetable_schedule_app/src/weekScreen/controller/week-screen-controller.dart';
import 'package:timetable_schedule_app/src/weekScreen/model/lesson-model.dart';

class WeekPlanScreen extends StatefulWidget {
  @override
  _WeekPlanScreenState createState() => _WeekPlanScreenState();
}

class _WeekPlanScreenState extends State<WeekPlanScreen> {
  WeekScreenController ctrl = new WeekScreenController();
  int dayNumber;
  Future<List<Lesson>> lessons;
  final days = ['Pn', 'Wt', 'Śr', 'Czw', 'Pt', 'Sb', 'Nd'];

  int bottomNavBarIndex;
  Color selectedTextColor = Colors.green;

  String selectedDay;

  final dayColor = [Colors.white, Colors.green];

  @override
  void initState() {
    super.initState();
    dayNumber = DateTime.now().day;
    selectedDay = days[0];
    bottomNavBarIndex = 0;
    lessons = ctrl.getLessonsForDay(dayNumber);
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

  _onButtonPressed(Lesson message) {
    print('xd');
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Text('Szczegóły'),
              myRowDataIcon(null, 'Nazwa zajęć: '+message.name),
              myRowDataIcon(
                  Icon(FontAwesomeIcons.clock), WeekScreenController.timeFormatter(message.startDateTime) + ' - ' + WeekScreenController.timeFormatter(message.finishDateTime)),
              myRowDataIcon(Icon(FontAwesomeIcons.calendarDay), WeekScreenController.dateFormatter(message.finishDateTime)),
              myRowDataIcon(Icon(FontAwesomeIcons.user),message.leaderName),
              myRowDataIcon(Icon(FontAwesomeIcons.mapMarkerAlt), message.place),
              RaisedButton(
                  child: Text('Edytuj'),
                  textColor: Colors.white,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                  onPressed: () => {print('mockup edition')}),
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
            future: lessons,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text("There was an error: ${snapshot.error}");
                  var lessons = snapshot.data;
                  return Material(
                      child: ListView.separated(
                    itemCount: lessons.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      Lesson message = lessons[index];
                      return ListTile(
                        title: Text(WeekScreenController.timeFormatter(message.startDateTime) +' - ' + WeekScreenController.timeFormatter(message.finishDateTime) + '        ' +message.name),
                        isThreeLine: true,
                        subtitle: Text(
                          'prowadzący: ' +
                              message.leaderName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => _onButtonPressed(message),
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
            dayNumber = index + 1;
            lessons = ctrl.getLessonsForDay(dayNumber);
 
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
              title: Text(days[5], style: TextStyle(color: Colors.grey))),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calendar),
              title: Text(days[6], style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
