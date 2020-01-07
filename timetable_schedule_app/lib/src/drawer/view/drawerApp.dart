import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable_schedule_app/src/addLessonScreen/view/addLesson.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';
import 'package:timetable_schedule_app/src/home/view.dart';
import 'package:timetable_schedule_app/src/weekScreen/view/weekPlanScreen.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("w@w.pl"),
            accountName: Text("Wiktoria Sobczyk"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://icons-for-free.com/iconfiles/png/512/female+person+user+woman+young+icon-1320196266256009072.png"),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.clipboardList),
            title: Text("Twój plan"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => WeekPlanScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.search),
            title: Text("Wyszukaj organizacje"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.calendarPlus),
            title: Text("Dodaj zajęcia"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => AddLessonScreen(),
                ),
              );
            },
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.signOutAlt),
                title: Text("Wyloguj się"),
                onTap: () {
                  GraphQLConfiguration.removeToken();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
