import 'package:dio/dio.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/networking/dio_helper.dart';

class HomeRepo {
  Future<String> logout(String token) async {
    try {
      final response = await DioHelper.postData(
        url: '/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        CacheHelper.removeData(key: 'token');
        return response.data['message'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } catch (e) {
      CacheHelper.removeData(key: 'token');
      throw Exception(e.toString());
    }
  }

  Future<void> saveTicket(String title, String description) async {
    final response = await DioHelper.postData(
      url: '/tickets',
      data: {'title': title, 'description': description},
    );
    try {
      if (response.statusCode == 201) {
        return;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getTickets() async {
    final response = await DioHelper.getData(url: '/tickets');

    try {
      if (response.statusCode == 200) {
        // Assuming the response data contains a 'data' field which is a list of tickets
        // Adjust this according to your actual API response structure
        return response.data['data'] as List<dynamic>;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
