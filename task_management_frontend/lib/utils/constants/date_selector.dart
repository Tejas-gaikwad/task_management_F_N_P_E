import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../app/config/colors.dart';
import '../../feature/dashboard/bloc/task_bloc.dart';

class DatePickerApp extends StatefulWidget {
  const DatePickerApp({super.key});

  @override
  _DatePickerAppState createState() => _DatePickerAppState();
}

class _DatePickerAppState extends State<DatePickerApp> {
  DateTime selectedDate = DateTime.now(); // Initially set to the current date

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Initial date set to the selectedDate
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      // If a date is selected, update the selectedDate variable
      setState(() {
        selectedDate = picked;
      });

      context.read<TaskBloc>().add(SelectTaskDate(dateTime: selectedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is SelectedDateState) {
          return InkWell(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });

                // ignore: use_build_context_synchronously
                context
                    .read<TaskBloc>()
                    .add(SelectTaskDate(dateTime: selectedDate));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: primaryFaintColor,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                DateFormat('dd MMM yyyy').format(state.date),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: primaryFaintColor,
                ),
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });

                // ignore: use_build_context_synchronously
                context
                    .read<TaskBloc>()
                    .add(SelectTaskDate(dateTime: selectedDate));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: textColorGrey,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                DateFormat('dd MMM yyyy').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColorGrey,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
