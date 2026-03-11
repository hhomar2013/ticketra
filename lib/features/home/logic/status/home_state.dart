abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class HomeLogoutSuccessState extends HomeState {}

class HomeLogoutErrorState extends HomeState {
  final String error;
  HomeLogoutErrorState(this.error);
}
