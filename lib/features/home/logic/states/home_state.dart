abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class HomeChangeBottomNavState extends HomeState {}

// Ticket Saving States
class HomeSaveTicketLoadingState extends HomeState {}
class HomeSaveTicketSuccessState extends HomeState {}

// Ticket Fetching States
class HomeTicketsLoadingState extends HomeState {}
class HomeTicketsSuccessState extends HomeState {}

class HomeLogoutLoadingState  extends HomeState{}
class HomeLogoutSuccessState extends HomeState {}
class HomeLogoutErrorState extends HomeState {
  final String error;
  HomeLogoutErrorState(this.error);
}
