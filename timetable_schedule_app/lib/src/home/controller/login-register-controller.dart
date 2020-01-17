import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';

class LogRegController {
  Future<String> authUser(String email, String password, bool isLogin) async {
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueriesMutations queryMutation = QueriesMutations();
    print(email);
    print(password);
    if (isLogin) {
      QueryResult result = await _client.mutate(MutationOptions(
          documentNode: gql(
        queryMutation.loginMutation(email, password),
      )));
      if (result.hasException) {
        print(result);
        return 'Nie udało się zalogować';
      } else {
        String token = result.data['login']['accessToken'];
        GraphQLConfiguration.setToken(token);
        print('login' + token);
        return null;
      }
    } else {
      QueriesMutations queryMutation = QueriesMutations();
      print(email);
      print(password);
      QueryResult result = await _client.mutate(MutationOptions(
          documentNode: gql(
        queryMutation.registerMutation(email, password),
      )));
      if (result.hasException) {
        print(result.exception);
        return 'Nie udało się zarejestorwać';
      } else {
        String token = result.data['register']['accessToken'];
        GraphQLConfiguration.setToken(token);
        print('register' + token);

        return null;
      }
    }
  }
}
