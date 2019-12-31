import 'package:flutter/material.dart';
import 'package:timetable_schedule_app/src/graphql/client-provider.dart';
import 'package:timetable_schedule_app/src/home/view.dart';
// import 'package:timetable_schedule_app/src/graphqlTest/view.dart';

final String GRAPHQL_ENDPOINT = 'https://countries.trevorblades.com/';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: GRAPHQL_ENDPOINT,
      subscriptionUri: null,
      child: MaterialApp(
        title: 'Zarządzanie planem',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
