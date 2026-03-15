import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:it_tickets/Core/Helpers/extentions.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/features/home/logic/cubit/home_cubit.dart';
import 'package:it_tickets/features/home/logic/states/home_state.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        return SliverAppBar(
          backgroundColor: ColorsManager.mainFounders,
          pinned: true,
          floating: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
          title: Text('Founders'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,

          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 20
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                context.read<HomeCubit>().logout();
              },
              icon: state is HomeLogoutLoadingState
                  ? CircularProgressIndicator(color: Colors.white)
                  : FaIcon(FontAwesomeIcons.signOut),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
