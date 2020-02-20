import 'package:timetable_schedule_app/src/graphql-test/model/country.dart';
import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';

class CountryController {
  Future<List<Country>> getCountriesList() async {
    List<Country> countries = new List<Country>();
    QueriesMutations queryMutation = QueriesMutations();
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(
      queryMutation.getContinets(),
    )));
    if (!result.hasException) {
      for (var i = 0; i < result.data["countries"].length; i++) {
        countries.add(Country(
          name: result.data['countries'][i]['name'],
          code: result.data['countries'][i]['code'],
          phone: result.data['countries'][i]['phone'],
          currency: result.data['countries'][i]['currency'],
          nativeLang: result.data['countries'][i]['native'],
        ));
      }
      print(countries[1].name);  
    }
      print(countries); 
     return countries;
  }
}
