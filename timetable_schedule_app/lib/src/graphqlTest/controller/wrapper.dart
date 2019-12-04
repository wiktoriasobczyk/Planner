import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../view.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink(uri: 'https://countries.trevorblades.com/');
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      ),
    );
    return GraphQLProvider(
      child: GraphqlTest(),
      client: client,
    );
  }
}
