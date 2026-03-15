import 'package:it_tickets/Core/Helpers/cash_helper.dart';

class Constants{
  static  late String userToken = CacheHelper.getData2(key: 'token') ?? '';
}