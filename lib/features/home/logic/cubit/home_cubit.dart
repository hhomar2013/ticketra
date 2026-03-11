import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/features/home/logic/status/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  void logout() {
    emit(HomeLoadingState());
    try {
      emit(HomeLogoutSuccessState());
    } catch (e) {
      emit(HomeLogoutErrorState(e.toString()));
    }
  }
}
