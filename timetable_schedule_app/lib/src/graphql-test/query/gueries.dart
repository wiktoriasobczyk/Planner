class QueriesMutations {
    String getContinets() {
    return r"""
      query GetContinets{
        countries{
  	      name
        }
      }
      """;
  }
}
