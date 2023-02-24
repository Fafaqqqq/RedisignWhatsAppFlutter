import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_app/main.dart';

class Facetime extends StatefulWidget {
  const Facetime({Key? key}) : super(key: key);

  @override
  State<Facetime> createState() => _FacetimeState();
}

class _FacetimeState extends State<Facetime> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/img/Call.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: SvgPicture.asset('assets/icons/video.svg'),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.red,
                    padding: const EdgeInsets.all(30.0),
                    shape: const CircleBorder(),
                    child: SvgPicture.asset('assets/icons/phone-call.svg'),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: SvgPicture.asset('assets/icons/mic.svg'),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),);
                          },
                        icon: SvgPicture.asset('assets/icons/arrow.svg')
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/lock.svg'),
                        const SizedBox(width: 8),
                        const Text(
                          "End -to-end Ecryption  on ETH",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: (){
                          print("Click");
                        },
                        icon: SvgPicture.asset('assets/icons/user-plus.svg')
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                const Text(
                  "00:37",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
