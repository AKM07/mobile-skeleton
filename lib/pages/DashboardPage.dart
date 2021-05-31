import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/SizeUtil.dart';
import '../utils/SizeUtil.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: SizeUtil.screenWidth,
        ),
      ),
    );
  }
}
