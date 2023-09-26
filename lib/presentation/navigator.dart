import 'package:flutter/material.dart';
import 'package:homekitchen_customer_mobile/presentation/notification_page.dart';
import 'package:homekitchen_customer_mobile/presentation/setting_page.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({super.key});

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  int _selectedIndex = 3;
  TextStyle? optionStyle;
  List<Widget>? _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    optionStyle = Theme.of(context).textTheme.bodyMedium;
    _widgetOptions = <Widget>[
      Text(
        'Home',
        style: optionStyle,
      ),
      Text(
        'Map',
        style: optionStyle,
      ),
      Text(
        'user',
        style: optionStyle,
      ),
      SettingPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Mom kitchen', style: Theme.of(context).textTheme.titleLarge)
            ]),
        // automaticallyImplyLeading: false,
        leading: Text(""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions?.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize:
            Theme.of(context).textTheme.bodyMedium?.fontSize?.toDouble() ??
                24.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.lightBlueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
            // backgroundColor: Colors.tealAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
            // backgroundColor: Colors.lightBlueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromARGB(255, 255, 215, 166),
        onTap: _onItemTapped,
      ),
    );
  }
}
