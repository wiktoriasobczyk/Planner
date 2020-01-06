import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddLessonCtrl {
  Future<String> addLessonCallout(
      String name,
      DateTime date,
      DateTime beginHour,
      DateTime endingHour,
      String teacher,
      String place) async {
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueriesMutations queryMutation = QueriesMutations();
    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(
      queryMutation.addLesson(
          name,
          this._dateparserDay(date) + this._dateparserTime(beginHour),
          this._dateparserDay(date) + this._dateparserTime(endingHour),
          place,
          teacher),
    )));
    if (result.hasException) {
      print(result.exception);
      return 'exception' + result.exception.toString();
    } else {
      print('test sie udal'+result.data['addEvent']['leaderName']);
      return 'Udało się dodać wydarzenie';
    }
  }

  String _dateparserDay(DateTime dateTime) {
    return dateTime.year.toString() +
        '-' +
        dateTime.month.toString() +
        '-' +
        dateTime.day.toString();
  }

  String _dateparserTime(DateTime dateTime) {
    return 'T' +
        dateTime.hour.toString() +
        ':' +
        dateTime.minute.toString() +
        ':' +
        dateTime.second.toString() +
        '.000Z';
  }
}
