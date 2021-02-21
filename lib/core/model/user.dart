class User {
  String firstName;
  String middleName;
  String lastName;
  String mobile;
  String mobileCountryCode;
  String displayName;
  String password;
  String confirmPassword;
  User({
    this.displayName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobile,
    this.mobileCountryCode,
    this.password,
    this.confirmPassword,
  });
  User.fromApi(Map<String, dynamic> json) {
    this.displayName = json['displayName'];
    this.firstName = json['firstName'];
    this.middleName = json['middleName'];
    this.lastName = json['lastName'];
    this.mobile = json['mobile'];
    this.mobileCountryCode = json['mobileCountryCode'];
    this.confirmPassword = json['confirmPassword'];
    this.password = json['password'];
  }
}
