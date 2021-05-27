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
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    color: AppColors.backgroundColor,
                    child: Column(
                      children: [
                        _buildCardView(),
                      ],
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
      height: 330,
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
          ElevatedButton(onPressed: () {}, child: Text('ACCEPTED'))
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
        ],
      ),
    );
  }
}
