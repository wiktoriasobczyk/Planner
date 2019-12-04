import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlTest extends StatefulWidget {
  @override
  _GraphqlTestState createState() => _GraphqlTestState();
}

class _GraphqlTestState extends State<GraphqlTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrapghQL test'),
      ),
      body: Query(
        options: QueryOptions(document: r"""
      query GetContinets{
        continents{
  	      name
        }
      }
      """),
        builder: (
          QueryResult result, {
          BoolCallback refetch,
          FetchMore fetchMore,
        }) {
          if (result.data == null) {
            return Text('no data found');
          }
          print('twoja stara');
          print(result.data['continents']);
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text(result.data['continents'][index]['name']);
            },
            itemCount: result.data['continents'].length,
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
