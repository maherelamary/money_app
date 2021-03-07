import 'package:http/http.dart' as request;
import 'package:money_app/core/api_config.dart';

class AuthenticationServices {
  Future registermobile(Map body) async {
    final String registerMobile = '/api/v1/identity/RegisterMobile';
    final String url = ApiConfig.baseApiUrl + registerMobile;
    print('Url => $url');
    var response = await request.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body,
    );
    return response;
  }
}
