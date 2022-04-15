import 'package:flavorsmoduleexample/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'app_config.dart';

void mainCommon() {
  // Here would be background init code, if any
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config!);
  }

  Widget _buildApp(AppConfig config) {
    return MaterialApp(
      title: config.appDisplayName.toString(),
      theme: ThemeData(
        primaryColor: Color(0xFF43a047),
        accentColor: Color(0xFFffcc00),
        primaryColorBrightness: Brightness.dark,
      ),
      home: ShowCaseWidget(
          builder: Builder(
              builder: (_) => HomePage(
                    isPaidMember: config.isPaidMembership,
                  ))),
    );
  }
}
