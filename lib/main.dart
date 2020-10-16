import 'package:flutter/material.dart';
import 'package:mobile_skeleton/model/sqliteModel.dart';
import 'package:mobile_skeleton/pages/LoginPage.dart';
import 'package:mobile_skeleton/utils/injector.dart';

import 'constants/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await baseDio();
  final bool isInitialized = await AgrotechDBModel().initializeDB();
  if (isInitialized) {
    runApp(MyApp());
  } else {
    debugPrint("fail to init db");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        // '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(color: Color(Constants.appMainColor), elevation: 0),
        primaryColor: Color(Constants.appMainColor),
        primaryColorDark: Color(Constants.appMainColor),
        accentColor: Color(0xFFe0e0e0),
        backgroundColor: Constants.appBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
