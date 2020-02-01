class Organization {
  String organizationId;
  String name;
  String code;
  // List<Plan> plans;

  // Organization({this.organizationId, this.name, this.code });
  Organization({ this.name});

  getName() => this.name;
  getCode() => this.code;
  // getPlans() => this.plans;
  getOrganizationId() => this.organizationId;

}
