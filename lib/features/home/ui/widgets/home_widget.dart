import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/Core/utils/size_config.dart';
import 'package:it_tickets/features/home/logic/cubit/home_cubit.dart';
import 'package:it_tickets/features/home/logic/states/home_state.dart';
import 'package:it_tickets/features/home/ui/widgets/home_sliver_app_bar.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return CustomScrollView(
          slivers: [
            const HomeSliverAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsManager.mainBlue.withOpacity(.5),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize,
                            vertical: SizeConfig.defaultSize * 1,
                          ),
                          child: Text(
                            'Tickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize,
                            vertical: SizeConfig.defaultSize * 2,
                          ),
                          child: Text(
                            '${cubit.ticketsNumber ?? 'No tickets found'}',
                            style: TextStyle(
                              fontSize: SizeConfig.defaultSize * 6,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.defaultSize * 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.defaultSize * 2,
                          horizontal: SizeConfig.defaultSize * 2,
                        ),
                        child: Text(
                          'Your tickets',
                          style: TextStyle(
                            color: ColorsManager.mainFounders,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize * 45,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: SizeConfig.defaultSize * .5,
                                mainAxisSpacing: SizeConfig.defaultSize * .5,
                              ),

                          itemBuilder: (context, index) {
                            return _buildTicketItem(context, index);
                          },
                          itemCount: cubit.ticketList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}

Widget _buildTicketItem(BuildContext context, int index) {
  var cubit = HomeCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: SizeConfig.defaultSize,
      height: 200,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue.withOpacity(.5),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${cubit.ticketList[index].title}',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 1.5,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
