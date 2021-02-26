import 'package:http/http.dart' as request;
import 'package:money_app/core/api_config.dart';
import 'package:money_app/core/model/user.dart';

class AuthenticationServices {
  Future registerUser(User newUser) async {
    final String registerMobile = '/api/v1/identity/RegisterMobile';
    final String url = ApiConfig.baseApiUrl + registerMobile;
    print('Url => $url');
    final body = newUser.toJson();
    await request.post(
      url,
      body: body,
    );
  }
}
