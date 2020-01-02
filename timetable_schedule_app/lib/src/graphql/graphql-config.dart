
import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: "https://murmuring-tundra-28589.herokuapp.com/graphql?fbclid=IwAR1_FBUtfI_ZL5fSPvSKqbj-VCrcCq8Ns57O4HcPunWAUAF0d0WPaeWjJAo",
  );
  // po rejestracji i logowaniu dawac header jak wylogujesz to go usunac
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}