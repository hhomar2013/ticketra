import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/networking/dio_helper.dart';
import 'package:it_tickets/Core/utils/size_config.dart';
import 'package:it_tickets/bloc_observ.dart';
import 'package:it_tickets/user_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  Bloc.observer = MyBlocObserver();
  runApp(UserApp());
}
