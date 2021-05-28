import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trytulu/AppColors.dart';
import 'package:trytulu/AppStyles.dart';
import 'package:trytulu/CustomAppBarWidget.dart';
import 'package:trytulu/models/TaskModel.dart';
import 'package:trytulu/services/TaskService.dart';

class TaskInformationPage extends StatefulWidget {
  TaskInformationPage({Key? key}) : super(key: key);

  @override
  _TaskInformationPageState createState() => _TaskInformationPageState();
}

class _TaskInformationPageState extends State<TaskInformationPage> {
  late TaskModel _taskModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      afterFirstLayout();
    });
  }

  afterFirstLayout() async {
    var taskService = Provider.of<ChopperClient>(context, listen: false)
        .getService<TaskService>();
    var response = await taskService.getTasks();

    if (response.isSuccessful) {
      final List<TaskModel> tasks = (response.body as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() {
        _taskModel = tasks[0];
        isLoading = false;
      });
    } else {
      // Error code received from server
      final code = response.statusCode;
      final error = response.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.main,
                    ),
                  )
                : Column(
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
                                _buildCardView(),
                                SizedBox(height: 32),
                                _buildChecklist(),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardView() {
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
          _buildCardHeader(),
          _buildLineView(),
          _buildClientInformation(),
          _buildLineView(),
          _buildLocationView(),
          _buildLineView(),
          _buildCalendarView(),
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

  _buildCardHeader() {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _taskModel.name,
            style: AppStyles.appbar_title,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('ACCEPTED'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
              backgroundColor: MaterialStateProperty.all(AppColors.main),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
            ),
          )
        ],
      ),
    );
  }

  _buildClientInformation() {
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
                  _taskModel.location,
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

  _buildLocationView() {
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
                  _taskModel.location,
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

  _buildChecklist() {
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
            itemCount: _taskModel.checkList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = _taskModel.checkList[index];
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

  _buildCalendarView() {
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
                  _taskModel.startTime.toString(),
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
                  _taskModel.finishByTime.toString(),
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
}
