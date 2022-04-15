import 'package:flutter/material.dart';

import 'app_config.dart';
import 'main_common.dart';
import 'resource/display_strings_app2.dart';

void main() {
  var configuredApp = AppConfig(StringResourceApp2(),
      appDisplayName: "Music App",
      isPaidMembership: false,
      appInternalId: 1,
      child: const MyApp());

  mainCommon();

  runApp(configuredApp);
}
