// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../app/config/colors.dart';
import 'bloc/task_bloc.dart';
import 'widgets/add_task_button_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsList = [lightPurpleColor, lightOrangeColor, lightRedColor];

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TasksFetchingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        if (state is TasksLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.allTasks.length,
            itemBuilder: (context, index) {
              final randomColor = colorsList[index % colorsList.length];
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: randomColor,
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Task Details : ',
                      style: TextStyle(
                          color: randomColor == lightOrangeColor
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '${state.allTasks[index].taskName}',
                      style: TextStyle(
                        color: randomColor == lightOrangeColor
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${state.allTasks[index].taskDescription}',
                      maxLines: 3,
                      style: TextStyle(
                        color: randomColor == lightOrangeColor
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${state.allTasks[index].taskPriority}',
                      style: TextStyle(
                        color: randomColor == lightOrangeColor
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    (state.allTasks[index].taskStartDate == 'null') ||
                            (state.allTasks[index].taskStartDate == null)
                        ? const SizedBox()
                        : Text(
                            DateFormat('dd MMM yyyy')
                                .format(state.allTasks[index].taskStartDate!),
                            style: TextStyle(
                              color: randomColor == lightOrangeColor
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 14,
                            ),
                          ),
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
