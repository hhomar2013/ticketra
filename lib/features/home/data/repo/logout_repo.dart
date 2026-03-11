import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/networking/dio_helper.dart';

class LogoutRepo {
  Future<String> logout() async {
    try {
      final response = await DioHelper.postData(
        url: '/login',
        data: {'token': CacheHelper.getData2(key: 'token')},
      );
      if (response.statusCode == 200) {
        CacheHelper.removeData(key: 'token');
        return 'Logout successful';
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
