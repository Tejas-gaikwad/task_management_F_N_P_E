import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';

class DashboardConsumerScreen extends StatelessWidget {
  const DashboardConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskAddedSuccessFullyState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task Added successfully')));
        } else if (state is TaskErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error while adding task.')));
        }
      },
      builder: (context, state) {
        if (state is TasksLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('HomeScreen'),
          );
        }
      },
    );
  }
}
