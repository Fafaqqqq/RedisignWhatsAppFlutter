import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/ui/screens/messag.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _TextH {
  String path;
  String title;
  String subtitle;
  bool visIcon;
  String icon;
  _TextH(this.path, this.title, this.subtitle, this.visIcon, this.icon);
}

class _HomeState extends State<Chats> {

  List<_TextH> elementSettigs = List.empty();

  @override
  void initState() {
    elementSettigs = [
      _TextH("assets/icons/QWE.svg", "Dad", "Buy some bread", true, "assets/icons/mesCheck.svg"),
      _TextH("assets/icons/QWE.svg", "Lera", "Message deleted", true, "assets/icons/mesEr.svg"),
      _TextH("assets/icons/QWE.svg", "Aleksandr", "ok", false, "assets/icons/mesCheck.svg"),
      _TextH("assets/icons/QWE.svg", "Mom", "Hi. how are you?", true, "assets/icons/mesTCheck.svg"),
      _TextH("assets/icons/QWE.svg", "Anton Ignatiev", "Truth?! I also want to)", false, "assets/icons/mesCheck.svg"),
      _TextH("assets/icons/QWE.svg", "Alfonzo Schuessler", "Buy some bread", false, "assets/icons/mesCheck.svg"),
      _TextH("assets/icons/QWE.svg", "Mikhail Petrovich", "Missed audio call", true, "assets/icons/MesCal.svg"),
      _TextH("assets/icons/QWE.svg", "Viktory", "Hi!", false, "assets/icons/mesCheck.svg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: elementSettigs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Message()),);
            },
            title: Container(
                padding: const EdgeInsets.only(bottom: 32),
                child: element(
                    elementSettigs[index].path,
                    elementSettigs[index].title,
                    elementSettigs[index].subtitle,
                    visIcon: elementSettigs[index].visIcon,
                    iconM: elementSettigs[index].icon
                )
            ),
          );
        },
      ),
    );
  }

  Widget element(
      String iconPath,
      String title,
      String subtitle,
      {bool visIcon = false,  String iconM = "assets/icons/video.svg"}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
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
                Row(
                  children: [
                    Visibility(
                      visible: visIcon,
                      child: Container(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(iconM)
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161),
                          fontSize: 16
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
