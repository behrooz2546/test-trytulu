import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trytulu/AppColors.dart';
import 'package:trytulu/AppStyles.dart';
import 'package:trytulu/Components/AppButton.dart';
import 'package:trytulu/CustomAppBarWidget.dart';
import 'package:trytulu/blocs/task/task_bloc.dart';
import 'package:trytulu/models/ChecklistModel.dart';
import 'package:trytulu/models/TaskModel.dart';

class TaskInformationPage extends StatefulWidget {
  TaskInformationPage({Key? key}) : super(key: key);

  @override
  _TaskInformationPageState createState() => _TaskInformationPageState();
}

class _TaskInformationPageState extends State<TaskInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return _handleTaskLoadingState();
                } else if (state is TaskLoaded) {
                  return _handleTaskLoadedState(state);
                } else {
                  return _handleTaskNotLoadedState();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardView({required TaskModel taskModel}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          _buildCardHeader(taskName: taskModel.name),
          _buildLineView(),
          _buildClientInformation(location: taskModel.location),
          _buildLineView(),
          _buildLocationView(location: taskModel.location),
          _buildLineView(),
          _buildCalendarView(
            startTime: taskModel.startTime,
            finishTime: taskModel.finishByTime,
          ),
        ],
      ),
    );
  }

  _buildLineView() {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.lineViewColor,
    );
  }

  _buildCardHeader({
    required String taskName,
  }) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              taskName,
              style: AppStyles.appbar_title,
            ),
          ),
          AppButton(
            text: 'ACCEPTED',
            onTap: () => _handleAcceptedButtonTapped(),
          )
        ],
      ),
    );
  }

  _buildClientInformation({required String location}) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'res/images/client.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: AppStyles.card_view_body,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset(
                'res/images/phone.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  '+1 2344366753',
                  style: AppStyles.card_view_body,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildLocationView({required String location}) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'res/images/location.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: AppStyles.card_view_body,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'res/images/map_enter.png',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildChecklist({required List<CheckListModel> checkList}) {
    return Column(
      children: [
        Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Checklist',
                  textAlign: TextAlign.left,
                  style: AppStyles.appbar_title.copyWith(color: Colors.white),
                ),
              ],
            )),
        Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: checkList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = checkList[index];
              return ExpansionTile(
                collapsedIconColor: AppColors.main,
                tilePadding: const EdgeInsets.symmetric(horizontal: 80),
                title: Text(
                  model.name,
                  style: AppStyles.checklist_item_title,
                ),
                children: [
                  Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            model.items[index].title,
                            style: AppStyles.checklist_item_title.copyWith(
                              color: AppColors.black,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            model.items[index].input,
                            style: AppStyles.checklist_item_title.copyWith(
                              color: AppColors.gray,
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                      itemCount: model.items.length,
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  _buildCalendarView({
    required DateTime startTime,
    required DateTime finishTime,
  }) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'res/images/calendar.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  startTime.toString(),
                  style: AppStyles.card_view_body,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Image.asset(
                'res/images/time.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  finishTime.toString(),
                  style: AppStyles.card_view_body,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Row(
              children: [
                Container(width: 20, height: 20),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Time for task: 3 hours',
                    style: AppStyles.card_view_body,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _handleTaskLoadingState() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.main,
      ),
    );
  }

  Widget _handleTaskLoadedState(TaskLoaded state) {
    return Column(
      children: [
        CustomAppBarWidget(
          title: 'Task Information',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              color: AppColors.backgroundColor,
              child: Column(
                children: [
                  _buildCardView(taskModel: state.tasks[0]),
                  SizedBox(height: 32),
                  _buildChecklist(checkList: state.tasks[0].checkList),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _handleTaskNotLoadedState() {
    print("Error");
    return Container();
  }

  _handleAcceptedButtonTapped() {
    print("_handleAcceptedButtonTapped");
  }
}
