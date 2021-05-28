import 'package:flutter/material.dart';
import 'package:trytulu/Utils/AppStyles.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  const CustomAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyles.appbar_title,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('res/images/back.png'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('res/images/help.png'),
            ),
          )
        ],
      ),
    );
  }
}
