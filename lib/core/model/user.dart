class User {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String mobile;
  String mobileCountryCode;
  bool isMobileVerified;
  String displayName;
  String password;
  String profilePath;
  String createdDate;
  User({
    this.id,
    this.displayName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobile,
    this.isMobileVerified,
    this.mobileCountryCode,
    this.password,
    this.profilePath,
    this.createdDate,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      displayName: json['displayName'] ?? "",
      firstName: json['firstName'] ?? "",
      middleName: json['middleName'] ?? "",
      lastName: json['lastName'] ?? "",
      mobile: json['mobile'] ?? "",
      isMobileVerified: json['isMobileVerified'] ?? false,
      mobileCountryCode: json['mobileCountryCode'] ?? "",
      password: json['password'] ?? "",
      profilePath: json['profilePicture'] ?? "",
      createdDate: json['createdDateTime'] ?? "",
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
      };
}
