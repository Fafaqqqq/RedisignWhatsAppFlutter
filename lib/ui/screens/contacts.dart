import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_app/main.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class TextW {
  String path;
  String title;
  String subtitle;
  bool visIcon;
  String status;
  TextW(this.path, this.title, this.subtitle, this.visIcon, this.status);
}

class _ContactsState extends State<Contacts> {

  List<TextW> elementSettigs = List.empty();

  @override
  void initState() {
    elementSettigs = [
      TextW("assets/icons/QWE.svg", "Maryland Winkles", "+7 (972) 603-38-67", true, "0"),
      TextW("assets/icons/QWE.svg", "Edgar Torrey", "+7 (913) 990-47-21", true, "1"),
      TextW("assets/icons/QWE.svg", "Krishna Barbe", "+7 (980) 241-27-69", true, "0"),
      TextW("assets/icons/QWE.svg", "Francene Vandyne", "+7 (974) 505-48-16", true, "0"),
      TextW("assets/icons/QWE.svg", "Cyndy Lillibridge", "+7 (948) 666-43-26", true, "1"),
      TextW("assets/icons/QWE.svg", "Alfonzo Schuessler", "+7 (945) 171-11-90", false, "0"),
      TextW("assets/icons/QWE.svg", "Thad Eddings", "+7 (986) 744-70-14", false, "0"),
      TextW("assets/icons/QWE.svg", "Tanner Stafford", "+7 (966) 209-16-26", false, "0"),
      TextW("assets/icons/QWE.svg", "Darron Kulikowski", "+7 (952) 954-56-75", true, "0"),
      TextW("assets/icons/QWE.svg", "Janetta Rotolo", "+7 (966) 672-43-81", false, "0"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          top(),
          SizedBox(
            height: 770,
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
                          visIcon: elementSettigs[index].visIcon,
                          status: elementSettigs[index].status
                      )
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget top(){
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
            "Contacts",
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

  Widget element(String iconPath, String title, String subtitle, {bool visIcon = false, String status = "0"}){
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
              child: status == "0" ? SvgPicture.asset('assets/icons/buttonInv.svg') : SvgPicture.asset('assets/icons/ButtonInved.svg')
          ),
        ),
      ],
    );
  }
}
