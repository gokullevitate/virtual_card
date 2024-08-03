import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29695D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(child: SvgPicture.asset('images/Group.svg')),
            SizedBox(
              height: 60,
            ),
            Text("Virtual Business Card",style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.7,
              fontFamily: 'Ubuntu',
            ),),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                          child: QrImageView(
                            data: 'https://levitatestudios.in/',
                            version: QrVersions.auto,
                            size: 250,
                            gapless: false,
                            embeddedImage: AssetImage('images/Vector.png'),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(50, 50),
                            ),
                          )
                      ),
                      Column(
                        children: [
                          Text("Sreeramachandran",style: TextStyle(
                            color: Color(0xff29695D),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.7,
                            fontFamily: 'Ubuntu',
                          ),),
                          Text("Co-founder | Chief Design Officer",style: TextStyle(
                            color: Color(0xff29695D),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.7,
                            fontFamily: 'Ubuntu',
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              'www.levitatestudios.in',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'Ubuntu',
                color: Color(0xffA6CDB2),
                height: 0.7,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

//'images/Frame.svg'
