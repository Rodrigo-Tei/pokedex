import 'package:flutter/material.dart';

class RouteSettingsHelper {
  static RouteSettings getRouteSettings(
      {required String path,
      required String description,
      required String origin}) {
    return RouteSettings(name: path, arguments: {
      'description': description,
      'origin': origin,
    });
  }
}
