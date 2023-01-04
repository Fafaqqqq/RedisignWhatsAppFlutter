import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _TextC {
  String path;
  String title;
  String subtitle;
  bool visIcon;
  _TextC(this.path, this.title, this.subtitle, this.visIcon);
}

class _HomeState extends State<Calls> {

  List<_TextC> elementSettigs = List.empty();

  @override
  void initState() {
    super.initState();
    elementSettigs = [
      _TextC("assets/icons/QWE.svg", "Alfonzo Schuessler", "+7 (972) 603-38-67", true),
      _TextC("assets/icons/QWE.svg", "Alfonzo Schuessler", "+7 (972) 603-38-67", true),
      _TextC("assets/icons/QWE.svg", "Alfonzo Schuessler", "+7 (972) 603-38-67", true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 14),
          child: element(
              "assets/icons/QWE.svg",
              "Alfonzo Schuessler",
              "+7 (972) 603-38-67",
          ),
        ),
        const SizedBox(height: 16,),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 28),
          child: const Text(
            "Last",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 18
            ),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: elementSettigs.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: (){
                  print(index);
                },
                title: Container(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: element(
                        elementSettigs[index].path,
                        elementSettigs[index].title,
                        elementSettigs[index].subtitle,
                        visIcon: elementSettigs[index].visIcon
                    )
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget element(String iconPath, String title, String subtitle, {bool visIcon = false}){
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
          ],
        ),
        Visibility(
          visible: visIcon,
          child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/manuCall.svg')
          ),
        ),
      ],
    );
  }
}
