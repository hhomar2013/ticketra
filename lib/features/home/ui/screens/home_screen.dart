import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:it_tickets/Core/Helpers/extentions.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/Core/widgets/custom_snack_bar.dart';
import 'package:it_tickets/features/home/data/repo/home_repo.dart';
import 'package:it_tickets/features/home/logic/cubit/home_cubit.dart';
import 'package:it_tickets/features/home/logic/states/home_state.dart';
import 'package:it_tickets/features/home/ui/widgets/home_floating_action_button.dart';
import 'package:it_tickets/features/home/ui/widgets/home_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..getTickets(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: state is HomeLoadingState
                ? const Center(child: CircularProgressIndicator())
                : cubit.screens[cubit.currentIndex],
            floatingActionButton: const HomeFloatingActionButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: [
                Icons.home,
                Icons.person,
                Icons.notifications,
                Icons.settings,
              ],
              activeColor: ColorsManager.mainFounders,
              inactiveColor: Colors.grey,
              activeIndex: cubit.currentIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
            ),
          );
        },
        listener: (context, state) {
          if (state is HomeLogoutSuccessState) {
            context.pushAndRemoveUntil('/loginScreen');
            CustomSnackBar(context);
          }



        },
      ),
    );
  }
}
