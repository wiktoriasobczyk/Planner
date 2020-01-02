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
    return r"""
      mutation register{
          register(input:{email: "$email", password: "$password"}){
            accessToken
          }
      }    
     """;
  }
}
