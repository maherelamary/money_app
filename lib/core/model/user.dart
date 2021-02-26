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
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      displayName: json['displayName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      mobile: json['mobile'] as String,
      mobileCountryCode: json['mobileCountryCode'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "mobile": mobile,
        "mobileCountryCode": mobileCountryCode,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
