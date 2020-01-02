import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';

class GraphqlTest extends StatefulWidget {
  @override
  _GraphqlTestState createState() => _GraphqlTestState();
}

class _GraphqlTestState extends State<GraphqlTest> {
  QueriesMutations queries = QueriesMutations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrapghQL test'),
      ),
      body: Query(
        options: QueryOptions(documentNode: gql(queries.getContinets())),
        builder: (
          QueryResult result, {
          Refetch refetch,
          FetchMore fetchMore,
        }) {
          if (result.data == null) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
          print(result.data['countries']);
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(result.data['countries'][index]['name']),
                onLongPress: () => print('wcisnales' +
                    Text(result.data['countries'][index]['name']).data),
              );
            },
            itemCount: result.data['countries'].length,
          );
        },
      ),
    );
    // return GraphQLProvider(
    //     child: SecondScreen(),
    //     client: client,
    // );
  }
}
