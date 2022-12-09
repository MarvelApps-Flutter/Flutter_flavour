import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final StringResource stringResource;

  AppConfig(this.stringResource,
      {this.appDisplayName,
      this.isPaidMembership,
      this.appInternalId,
      required Widget child})
      : super(child: child);
  bool? isPaidMembership;
  String? appDisplayName;
  int? appInternalId;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

abstract class StringResource {
  String? APP_DESCRIPTION;
}
