import 'package:it_tickets/Core/networking/dio_helper.dart';

class LoginRepo {
  Future<String> login(String email, String password) async {
    try {
      final response = await DioHelper.postData(
        url: '/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final token = response.data['token'];

        if (token == null) {
          throw Exception("Token is null");
        }

        return token;
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
