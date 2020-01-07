class QueriesMutations {
  String getContinets() {
    return r"""
      query GetContinets{
        countries{
  	      name,
          code,
          phone,
          currency,
          native
        }
      }
      """;
  }
  String getLessonsByDay(int dayNumber) {
    return """
    query getEvents{
        getEventsForDay(dayOfWeek: {dayNumber: $dayNumber}){
          name
          startDateTime
          finishDateTime
          leaderName
          place
        }
      }
      """;
  }

  String registerMutation(String email, String password) {
    return """
      mutation register{
          register(input:{email: "$email", password: "$password"}){
            accessToken
          }
      }    
     """;
  }
  String loginMutation(String email, String password) {
    return """
      mutation register{
          login(input:{email: "$email", password: "$password"}){
            accessToken
          }
      }    
     """;
  }
  String addLesson(String name, String startDateTime, String finishDateTime, String place, String leaderName ) {
    return """
      mutation addEvent{
          addEvent(eventData:{name: "$name", startDateTime: "$startDateTime",finishDateTime: "$finishDateTime",place: "$place",leaderName: "$leaderName"}){
            leaderName
          }
      }    
     """;
  }

  String test() {
    return """
      query test {
        test{
          accessToken
          id
        }
      }
    """;
  }
}
