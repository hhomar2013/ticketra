import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/Core/widgets/custom_text_field.dart';
import 'package:it_tickets/features/auth/logic/cubit/login_cubit.dart';
import 'package:it_tickets/features/auth/logic/states/login_state.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(  horizontal: 50 ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/founders.png' , width: double.infinity, height: 200,),
              SizedBox(height: 8.h),
              Text(
                'Enter your credentials to access your tickets.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32.h),

              CustomTextField(
                label: 'Email Address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hint: 'user.name@founders-ge.com',
              ),
          
              SizedBox(height: 20.h),

              CustomTextField(
                label: 'Password',
                controller: passwordController,
                obscureText: true,
                hint: '******',
              ),
          
              SizedBox(height: 40.h),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.maxFinite,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: state is LoginLoadingState ? null : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainFounders, // أسود فخم
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: state is LoginLoadingState
                          ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                      )
                          : Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


}