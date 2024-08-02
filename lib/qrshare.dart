import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29695D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Center(child: SvgPicture.asset('images/Group.svg')),
            SizedBox(height: 60,),
            Center(child: SvgPicture.asset('images/Frame.svg')),
            SizedBox(height: 50,),
            Text('www.levitatestudios.in',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: 'Ubuntu',
              color: Color(0xffA6CDB2),
              height: 0.7,
            ),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}