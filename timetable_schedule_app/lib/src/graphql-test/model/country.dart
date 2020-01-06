class Country {
  String name;
  String code;
  String phone;
  String currency;
  String nativeLang;

  Country({this.name, this.code, this.phone, this.currency, this.nativeLang});

  getName() => this.name;
  getCode() => this.code;
  getPhone() => this.phone;
  getCurrency() => this.currency;
  getNativeLang() => this.nativeLang;
}
