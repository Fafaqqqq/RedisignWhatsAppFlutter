import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/main.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return Scaffold(
      body: Column(
        children: [
          top(),
          body(),
          bottom()
        ],
      ),
    );
  }

  Widget top(){
    return Container(
      height: 126,
      color: const Color(0xFF1BAC4B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),);
            },
            icon: SvgPicture.asset("assets/icons/fi-br-arrow-left.svg"),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset("assets/icons/QWE.svg",
          width: 40, height: 40,),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Halloween Party ",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF56E39F),
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: const Text(
                  "2 Online",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 28,),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/icons/Group 4.svg'),
                SvgPicture.asset('assets/icons/fi-br-mode-landscape.svg'),
                SvgPicture.asset('assets/icons/fi-br-menu-dots-vertical.svg'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget body(){
    return Image.asset(
        "assets/img/Chat Area.png",
      width: 380,
    );
  }

  Widget bottom(){
    return Container(
      height: 67,
      decoration: const BoxDecoration(
        color: Color(0xFFEEF1F4),
        borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      child: Row(
        children: [
          const SizedBox(width: 18,),
          SvgPicture.asset('assets/icons/fi-br-comment-check.svg'),
          const SizedBox(width: 18,),
          Container(
            width: 310,
            height: 50,
            decoration: const BoxDecoration(
                color: Color(0xFFD3D4FF),
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Text("Type something"),
                const SizedBox(width: 150),
                SvgPicture.asset('assets/icons/fi-br-laugh.svg'),
              ],
            ),
          )
        ],
      )
    );
  }

}
