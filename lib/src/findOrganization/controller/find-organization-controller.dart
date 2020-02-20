import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';
import 'package:timetable_schedule_app/src/findOrganization/model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FindOrganizationCtrl {
  // Future<List<Organization>> getOrganizationByCode(
  Future<String> getOrganizationByCode(String organizationNumber) async {
    print('organization find execution');
    List<Organization> organizations = new List<Organization>();
    QueriesMutations queryMutation = QueriesMutations();
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(
      queryMutation.findByCode(organizationNumber),
    )));
    if (!result.hasException) {
      print('brak wyjatku');
      // for (var i = 0; i < result.data["data"].length; i++) {
      organizations.add(Organization(
        name: result.data['findByCode']['name'],
      ));
      organizations.add(Organization(
        name: result.data['findByCode']['name'],
      ));
      // }
      print(result.data['findByCode']['name']);
      print(organizations.toString());
      return result.data['findByCode']['name'];
      // return organizations;
    }
    print(result.exception);
    return 'Organizacja o podanym kodzie nie istnieje';
  }
}
