import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:page_transition/page_transition.dart';

class RouteConfig {
  RouteConfig._();

  static RouteConfig get instance => RouteConfig._();

  PageTransition routes(RouteSettings settings) {
    return routeWithName(settings: settings);
  }

  PageTransition routeWithName({String? routeName, RouteSettings? settings}) {
    Widget widget;
    try {
      widget =
          GetIt.instance.get<Widget>(instanceName: routeName ?? settings?.name);
    } catch (e) {
      widget = Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(''),
        ),
        body: const Center(child: Text('Không tìm thấy trang')),
      );
    }
    return PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      settings: settings,
    );
  }
}
