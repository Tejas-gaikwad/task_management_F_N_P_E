import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/config/colors.dart';
import '../../../utils/constants/button.dart';
import '../../../utils/constants/date_selector.dart';
import '../bloc/task_bloc.dart';

class AddTaskActionButton extends StatelessWidget {
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;
  double value;
  AddTaskActionButton({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addTask(context);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              offset: const Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 1,
            )
          ],
          color: primaryFaintColor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16.0),
        child: const Icon(
          Icons.add,
          color: iconWhiteColor,
        ),
      ),
    );
  }

  void addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: primaryDarkColor,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateModel) {
            return SliderTheme(
              data: SliderThemeData(
                inactiveTickMarkColor: Colors.white,
                thumbShape: SliderComponentShape.noOverlay,
                trackHeight: 50,
                activeTickMarkColor: Colors.transparent,
                trackShape: const RectangularSliderTrackShape(),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BlocProvider(
                  create: (_) => TaskBloc(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: const Text(
                            'Add Task Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColorWhite,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: textColorGrey,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Select Priority',
                                    style: TextStyle(
                                      color: textColorWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    value.round().toString(),
                                    style: const TextStyle(
                                      color: textColorWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0.0, 0.0),
                                          color: value == 1.0
                                              ? Colors.white.withOpacity(0.2)
                                              : lightPurpleColor
                                                  .withOpacity(0.2),
                                          blurRadius: 20.0,
                                          spreadRadius: 1.0,
                                        )
                                      ],
                                    ),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Slider(
                                        activeColor: lightPurpleColor,
                                        thumbColor: Colors.transparent,
                                        min: 1.0,
                                        max: 5.0,
                                        divisions: 5,
                                        value: value,
                                        onChanged: (val) {
                                          setStateModel(() {
                                            value = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  headerAndContent(
                                    'Name:',
                                    textFieldWidget(context, 'Enter task name',
                                        taskNameController),
                                  ),
                                  const SizedBox(height: 15),
                                  headerAndContent(
                                    'Description:',
                                    textFieldWidget(
                                      context,
                                      'Enter task description',
                                      taskDescriptionController,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  headerAndContent(
                                    'Start Date:',
                                    BlocProvider(
                                      create: (context) => TaskBloc(),
                                      child: const DatePickerApp(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          return addTaskButton(state, context);
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  textFieldWidget(BuildContext context, String hintText,
      TextEditingController textEditingController) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: textColorGrey,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: textEditingController,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textColorGrey,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: textColorGrey,
          ),
        ),
      ),
    );
  }

  headerAndContent(String headerText, headerWidget) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              headerText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textColorWhite,
              ),
            ),
          ),
          headerWidget,
        ],
      ),
    );
  }

  addTaskButton(TaskState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ButtonWidget(
        buttonText: 'Add Task',
        borderColor: primaryFaintColor,
        buttonColor: lightPurpleColor,
        textColor: textColorWhite,
        onTap: () {
          if (taskNameController.text.isEmpty ||
              taskDescriptionController.text.isEmpty) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Please fill all fields.')));
          } else {
            context.read<TaskBloc>().add(
                  TaskAddEvent(
                    taskName: taskNameController.text,
                    taskDescription: taskDescriptionController.text,
                    taskDate: (state is SelectedDateState)
                        ? state.date
                        : DateTime.now(),
                    taskPriority: value,
                  ),
                );
          }
        },
      ),
    );
  }
}
