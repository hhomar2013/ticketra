import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/Core/Helpers/cash_helper.dart';
import 'package:it_tickets/features/home/data/models/ticket_model.dart';
import 'package:it_tickets/features/home/data/repo/home_repo.dart';
import 'package:it_tickets/features/home/logic/states/home_state.dart';
import 'package:it_tickets/features/home/ui/widgets/home_widget.dart';
import 'package:it_tickets/features/profile/ui/screens/profile_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<TicketModel> ticketList = [];
  int currentIndex = 0;
  
  List<Widget> screens = [
    const HomeWidget(),
    const ProfileScreen(),
    const Center(child: Text('Notifications Screen')),
    const Center(child: Text('Settings Screen')),
  ];
  
  int ticketsNumber = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  Future<void> getTickets() async {
    emit(HomeTicketsLoadingState());
    try {
      final data = await homeRepo.getTickets();
      ticketList = data.map((item) => TicketModel.fromJson(item)).toList();
      ticketsNumber = ticketList.length;
      emit(HomeTicketsSuccessState());
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> saveTicket(String title, String description) async {
    emit(HomeSaveTicketLoadingState());
    try {
      await homeRepo.saveTicket(title, description);
      emit(HomeSaveTicketSuccessState());

    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(HomeLogoutLoadingState());
    final String token = CacheHelper.getData2(key: 'token').toString();
    try {
      await homeRepo.logout(token);
      emit(HomeLogoutSuccessState());
    } catch (e) {
      emit(HomeLogoutErrorState(e.toString()));
    }
  }
}
