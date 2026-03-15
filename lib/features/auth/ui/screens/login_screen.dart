import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/Core/Helpers/extentions.dart';
import 'package:it_tickets/Core/Routing/routes.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/features/auth/data/repos/login_repo.dart';
import 'package:it_tickets/features/auth/logic/cubit/login_cubit.dart';
import 'package:it_tickets/features/auth/logic/states/login_state.dart';
import 'package:it_tickets/features/auth/ui/widgets/login_form_widget.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:snackify/snackify.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepo()),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Snackify.show(context: context, type: SnackType.success , title: Text(
                'Well Done !',
              ),subtitle:  Text('Welcome Back 👋❤️') ,position: SnackPosition.top);
              context.pushAndRemoveUntil(Routes.homeScreen);
            }
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login Failed: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(height: 200, color: ColorsManager.mainFounders),

                const Positioned(
                  top: 80,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text(
                      'Welcome Back 👋',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 150),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),

                    ),
                  ),
                  child: const LoginFormWidget(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
