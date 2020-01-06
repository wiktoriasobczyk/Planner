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
