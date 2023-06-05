import 'package:http/http.dart';

class AuthRepository {
  Future<bool> login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        "passowrd": password,
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
