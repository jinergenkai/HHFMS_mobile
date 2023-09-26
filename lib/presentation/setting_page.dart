import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:homekitchen_customer_mobile/main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[Text("Page")],
      ),
    );
  }
}
