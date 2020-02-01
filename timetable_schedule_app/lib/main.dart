import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';
import 'package:timetable_schedule_app/src/home/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfig.client,
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
