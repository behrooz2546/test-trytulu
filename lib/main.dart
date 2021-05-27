import 'package:flutter/material.dart';
import 'package:trytulu/AppColors.dart';
import 'package:trytulu/AppStyles.dart';
import 'package:trytulu/CustomAppBarWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TryTulu Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'Montserrat',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<CheckListModel> checkListModel;

  @override
  void initState() {
    super.initState();
    checkListModel = CheckListModel.getSample();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
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
            'Sanitization',
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
                  'Client name',
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
                  '2715 Ash Dr. San Jose, South Dakota 83475',
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
            itemCount: checkListModel.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = checkListModel[index];
              return ExpansionTile(
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
                  'Wed 18, Nov',
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
                  'Start: 2:00am - 5:00am',
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

class Item {
  String title;
  String input;

  Item({
    required this.title,
    required this.input,
  });
}

class CheckListModel {
  String name;
  List<Item> items;
  bool isExpanded;

  CheckListModel({
    required this.name,
    required this.items,
    this.isExpanded = false,
  });

  static List<CheckListModel> getSample() {
    return [
      CheckListModel(
        name: "Before starting",
        items: [
          Item(title: "Selfie with equipment", input: "photo"),
          Item(title: "Record filling up bucket ", input: "video"),
          Item(title: "Bucket soap measurement", input: "number"),
        ],
      ),
      CheckListModel(
        name: "Main Room",
        items: [
          Item(title: "Photo of room", input: "photo"),
          Item(title: "Mop the floor", input: "video"),
        ],
      ),
      CheckListModel(
        name: "Finishing",
        items: [
          Item(title: "Clean equipment and dispose of rubbish", input: "photo"),
          Item(title: "Equipment put back", input: "video"),
          Item(title: "Building door locked", input: "checkbox"),
        ],
      )
    ];
  }
}
