import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/Core/Routing/app_router.dart';
import 'package:it_tickets/Core/Routing/routes.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/Core/utils/size_config.dart';
import 'package:it_tickets/features/auth/data/repos/login_repo.dart';
import 'package:it_tickets/features/auth/logic/cubit/login_cubit.dart';
import 'package:it_tickets/features/home/data/repo/home_repo.dart';
import 'package:it_tickets/features/home/logic/cubit/home_cubit.dart';
// import 'package:responsive_framework/responsive_framework.dart';

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    final token = CacheHelper.getData2(key: 'token');
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit(LoginRepo())),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(HomeRepo())..getTickets(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'tickera',
          theme: ThemeData(
            primaryColor: ColorsManager.mainFounders,
            scaffoldBackgroundColor: Colors.white,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: AppRouter().generateRoutes,
        ),
      ),
    );
  }
}
