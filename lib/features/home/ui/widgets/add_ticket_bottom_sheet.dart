import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:it_tickets/Core/theming/colors.dart';
import 'package:it_tickets/Core/widgets/custom_text_field.dart';
import 'package:it_tickets/features/home/logic/cubit/home_cubit.dart';
import 'package:it_tickets/features/home/logic/states/home_state.dart';

class AddTicketBottomSheet extends StatefulWidget {
  const AddTicketBottomSheet({super.key});

  @override
  State<AddTicketBottomSheet> createState() => _AddTicketBottomSheetState();
}

class _AddTicketBottomSheetState extends State<AddTicketBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Create New Ticket',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.mainFounders,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: 'Title',
                  controller: titleController,
                  hint: 'Enter ticket title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomTextField(
                  label: 'Description',
                  controller: descriptionController,
                  hint: 'Enter ticket description',
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                Text(
                  'Upload Images',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: double.infinity,
                    height: 100.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[50],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.cloudArrowUp, color: ColorsManager.mainFounders, size: 30.sp),
                        SizedBox(height: 5.h),
                        Text(
                          'Tap to upload images',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.saveTicket(titleController.text, descriptionController.text);
                        // Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.mainFounders,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Submit Ticket',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
        if(state is HomeSaveTicketSuccessState){
          titleController.clear();
          descriptionController.clear();
          context.read<HomeCubit>().getTickets();
          print('ticket  saved');
          Navigator.pop(context);
        setState(() {

        });
        }


    },);
  }
}
