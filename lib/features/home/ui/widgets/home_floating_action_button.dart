import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/features/home/ui/widgets/add_ticket_bottom_sheet.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const AddTicketBottomSheet(),
        );
      },
      backgroundColor: ColorsManager.mainFounders,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: const FaIcon(
        FontAwesomeIcons.plus,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
