import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';

class LogRegController {
  Future<String> authRegUser(String email, String password) async {
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueriesMutations queryMutation = QueriesMutations();
    print(email);
    print(password);
    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(
      queryMutation.registerMutation(email, password),
    )));
    if (result.hasException) {
      print(result.exception);
      return 'Rejestracja nie powiodła się';
    } else {
      String token = result.data['register']['accessToken'];
      GraphQLConfiguration.setToken(token);

      return null;
    }
  }
}
