import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whats_app/ui/screens/main/calls.dart';
import 'package:whats_app/ui/screens/main/chats.dart';
import 'package:whats_app/ui/screens/qr.dart';
import 'package:whats_app/ui/screens/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Column(
        children: [
          _body(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff00B1B3),
        onTap: _onItemTapped,
      ),
    );
  }


  Widget _body(int selectedIndexForMenu) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: IndexedStack(
        index: selectedIndexForMenu,
        alignment: AlignmentDirectional.center,
        children: const [
          Calls(),
          Chats(),
          //Status(),
          QR()
        ],
      ),
    );
  }
}
