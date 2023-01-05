import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/main.dart';
import 'package:whats_app/ui/screens/qr.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class TextW {
  String path;
  String title;
  String subtitle;
  TextW(this.path, this.title, this.subtitle);
}

class _SettingsState extends State<Settings> {

  List<TextW> elementSettigs = List.empty();

  @override
  void initState() {
    elementSettigs = [
      TextW('assets/icons/fi-br-key.svg', "Account", "Privacy, security, number change"),
      TextW('assets/icons/fi-br-comment-check.svg', "Chat", "Theme, wallpaper, chat history"),
      TextW('assets/icons/fi-br-bell.svg', "Notifications", "Sounds for messages, groups and calls"),
      TextW('assets/icons/fi-br-opacity.svg', "Data and storage", "Network usage, startup"),
      TextW('assets/icons/fi-br-world.svg', "Application language", "English (phone language)"),
      TextW('assets/icons/fi-br-interrogation.svg', "Help", "Help Center, Contact Us, Privacy Policy"),
      TextW('assets/icons/fi-br-user-add.svg', "To invite a friend", ""),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topBack(),
          const SizedBox(height: 30),
          top(),
          const SizedBox(height: 12),
          Container(
            color: const Color(0xffD9D9D9),
            height: 2,
          ),
          const SizedBox(height: 42),
          body(),
          const SizedBox(height: 100),
          bottom()
        ],
      ),
    );
  }

  Widget topBack(){
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 28),
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),);
            },
            icon: SvgPicture.asset("assets/icons/fi-br-arrow-left.svg", color: const Color(0xff212121),),
          ),
          const SizedBox(width: 16),
          const Text(
            "Settings",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff212121),
                fontSize: 18
            ),
          ),
        ],
      ),
    );
  }

  Widget top(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        element(
            'assets/icons/QWE.svg',
            'Thad Eddings',
            'Hello! I used WhatsApp.',
            visIcon: false
        ),
        IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QR()),);
          },
          icon: SvgPicture.asset(
            'assets/icons/fi-br-transform.svg',
          ),
        ),
      ],
    );
  }

  Widget body(){
    return SizedBox(
      height: 450,
      child: ListView.builder(
        itemCount: elementSettigs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              print(index);
            },
            title: Container(
                padding: const EdgeInsets.only(bottom: 18),
                child: element(
                    elementSettigs[index].path,
                    elementSettigs[index].title,
                    elementSettigs[index].subtitle)
            ),
          );
        },
      ),
    );
  }

  Widget bottom(){
    return SvgPicture.asset('assets/icons/fi-br-physics.svg');
  }

  Widget element(String iconPath, String title, String subtitle, {bool visIcon = false}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 28),
        SvgPicture.asset(iconPath),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff616161),
                fontSize: 16
              ),
            )
          ],
        ),
        Visibility(
          visible: visIcon,
          child: Container(
            padding: const EdgeInsets.only(left: 80),
              child: SvgPicture.asset('assets/icons/fi-br-transform.svg')
          ),
        ),
      ],
    );
  }
}
