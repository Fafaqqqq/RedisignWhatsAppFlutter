import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_app/ui/screens/settings.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          top(),
          SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/icons/QWE.svg"),
                Column(
                  children: const [
                    Text(
                      "Thad Eddings",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Hello! I used WhatsApp.",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161),
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/img/qr.png'),
                const Text(
                  "Your code is confidential. The people you\n "
                      "share it with will be able to scan it with\n "
                      "the app's camera to add you to their\n "
                      "content list.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff616161),
                      fontSize: 16
                  ),
                ),
              ],
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
                MaterialPageRoute(builder: (context) => const Settings()),);
            },
            icon: SvgPicture.asset("assets/icons/fi-br-arrow-left.svg", color: const Color(0xff212121),),
          ),
          const SizedBox(width: 16),
          const Text(
            "QR-code",
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
}
