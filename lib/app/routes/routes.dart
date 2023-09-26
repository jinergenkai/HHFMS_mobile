import 'package:flutter/widgets.dart';
import 'package:homekitchen_customer_mobile/app/app.dart';
import 'package:homekitchen_customer_mobile/home/home.dart';
import 'package:homekitchen_customer_mobile/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
