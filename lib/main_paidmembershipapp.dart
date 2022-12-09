import 'package:flutter/material.dart';

import 'resource/display_strings_app1.dart';

import 'app_config.dart';
import 'main_common.dart';

void main() {
  var configuredApp = AppConfig(StringResourceApp1(),
      appDisplayName: "Music App",
      isPaidMembership: true,
      appInternalId: 1,
      child: const MyApp());

  mainCommon();

  runApp(configuredApp);
}
