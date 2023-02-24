import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/ui/screens/contacts.dart';
import 'package:whats_app/ui/screens/facetime.dart';
import 'package:whats_app/ui/screens/main/calls.dart';
import 'package:whats_app/ui/screens/main/chats.dart';
import 'package:whats_app/ui/screens/main/status.dart';
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
  String title = "Chats";

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
          _appbar(),
          _body(_selectedIndex),
        ],
      ),
      bottomNavigationBar: Container(
          height: 67,
          decoration: const BoxDecoration(
              color: Color(0xFFEEF1F4),
              borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){
                  _onItemTapped(0);
                  setState(() {
                    title = "Chats";
                  });
                },
                icon: SvgPicture.asset('assets/icons/menuMessage.svg'),
              ),
              IconButton(
                onPressed: (){
                  _onItemTapped(1);
                  setState(() {
                    title = "Cals";
                  });
                },
                icon: SvgPicture.asset('assets/icons/manuCall.svg'),
              ),
              IconButton(
                onPressed: (){
                  _onItemTapped(2);
                  setState(() {
                    title = "Status";
                  });
                },
                icon: SvgPicture.asset('assets/icons/menuContacts.svg'),
              ),
            ],
          )
      )
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
          Chats(),
          Calls(),
          Status(),
        ],
      ),
    );
  }


  Widget _appbar(){
    return Container(
      height: 100,
      width: 390,
      alignment: Alignment.center,
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/WhatsApp.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Facetime()),);
                      },
                      icon: SvgPicture.asset('assets/icons/fi-br-camera.svg'),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Contacts()),);
                      },
                      icon: SvgPicture.asset('assets/icons/fi-br-user-add.svg'),
                    ),
                    IconButton(
                      onPressed: (){

                      },
                      icon: SvgPicture.asset('assets/icons/fi-br-search.svg'),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Settings()),);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/fi-br-menu-dots-vertical.svg',
                        color: const Color(0xFF374957),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22,),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18
              ),
            ),
          ],
        ),
      ),
    );
  }
}
