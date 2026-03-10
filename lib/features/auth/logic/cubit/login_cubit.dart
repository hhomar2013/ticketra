import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/Core/networking/dio_helper.dart';
import 'package:it_tickets/features/auth/data/repos/login_repo.dart';
import 'package:it_tickets/features/auth/logic/states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  final LoginRepo loginRepo;

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final token = await loginRepo.login(email, password);

      emit(LoginSuccessState(token));
    } catch (e) {
      print('Login failed: ${e.toString()}');
      emit(LoginErrorState(e.toString()));
    }
  }

}
