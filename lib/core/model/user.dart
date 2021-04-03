// class User {
//   int id;
//   String firstName;
//   String middleName;
//   String lastName;
//   String mobile;
//   String mobileCountryCode;
//   bool isMobileVerified;
//   String displayName;
//   String password;
//   String profilePath;
//   String createdDate;
//   String token;
//   String refreshToken;
//   User({
//     this.id,
//     this.displayName,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.mobile,
//     this.isMobileVerified,
//     this.mobileCountryCode,
//     this.password,
//     this.profilePath,
//     this.createdDate,
//     this.token,
//     this.refreshToken,
//   });
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? 0,
//       token: json['token'] ?? "",
//       refreshToken: json['refreshToken'] ?? "",
//       displayName: json['displayName'] ?? "",
//       firstName: json['firstName'] ?? "",
//       middleName: json['middleName'] ?? "",
//       lastName: json['lastName'] ?? "",
//       mobile: json['mobile'] ?? "",
//       isMobileVerified: json['isMobileVerified'] ?? false,
//       mobileCountryCode: json['mobileCountryCode'] ?? "",
//       password: json['password'] ?? "",
//       profilePath: json['profilePicture'] ?? "",
//       createdDate: json['createdDateTime'] ?? "",
//     );
//   }
//   Map<String, dynamic> toJson() => {
//         "displayName": displayName,
//         "firstName": firstName,
//         "middleName": middleName,
//         "lastName": lastName,
//         "mobile": mobile,
//         "mobileCountryCode": mobileCountryCode,
//         "password": password,
//       };
// }
class User {
  User({
    this.token,
    this.refreshToken,
    this.profile,
  });

  String token;
  String refreshToken;
  Profile profile;
  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        refreshToken: json["refreshToken"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "profile": profile.toJson(),
      };
}

class Profile {
  Profile({
    this.userName,
    //this.applicationUserId,
    //this.memberTypeId,
    this.memberTypeName,
    this.firstName,
    this.middleName,
    this.lastName,
    //this.gender,
    this.country,
    //this.countryCode,
    this.city,
    this.mobile,
    this.mobileCountryCode,
    this.isMobileVerified,
    this.profilePicture,
    this.displayName,
    this.role,
    //this.picture,
    //this.pictureFormat,
    this.otp,
    this.id,
    this.password,
    this.conformPassword,
    // this.createdDateTime,
    // this.status,
  });

  String userName;
  int applicationUserId;
  dynamic memberTypeId;
  dynamic memberTypeName;
  String firstName;
  String middleName;
  String lastName;
  String password;
  String conformPassword;
  int gender;
  String country;
  String countryCode;
  String city;
  String mobile;
  String mobileCountryCode;
  bool isMobileVerified;
  dynamic profilePicture;
  String displayName;
  String role;
  dynamic picture;
  dynamic pictureFormat;
  dynamic otp;
  int id;
  DateTime createdDateTime;
  int status;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userName: json["userName"],
        //applicationUserId: json["applicationUserId"],
        //memberTypeId: json["memberTypeId"],
        memberTypeName: json["memberTypeName"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        //gender: json["gender"],
        //country: json["country"],
        //countryCode: json["countryCode"],
        //city: json["city"],
        mobile: json["mobile"],
        mobileCountryCode: json["mobileCountryCode"],
        isMobileVerified: json["isMobileVerified"],
        profilePicture: json["profilePicture"],
        displayName: json["displayName"],
        role: json["role"],
        //picture: json["picture"],
        //pictureFormat: json["pictureFormat"],
        otp: json["otp"],
        id: json["id"],
        password: json["password"],
        conformPassword: json["conform_password"],
        //createdDateTime: DateTime.parse(json["createdDateTime"]),
        //status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "applicationUserId": applicationUserId,
        "memberTypeId": memberTypeId,
        "memberTypeName": memberTypeName,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        //"gender": gender,
        //"country": country,
        //"countryCode": countryCode,
        //"city": city,
        "mobile": mobile,
        "mobileCountryCode": mobileCountryCode,
        "isMobileVerified": isMobileVerified,
        "profilePicture": profilePicture,
        "displayName": displayName,
        "role": role,
        "password": password,
        "conform_password": conformPassword,
        //"picture": picture,
        //"pictureFormat": pictureFormat,
        //"otp": otp,
        "id": id,
        // "createdDateTime": createdDateTime.toIso8601String(),
        // "status": status,
      };
}
