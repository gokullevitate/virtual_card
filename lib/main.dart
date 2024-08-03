import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'qrshare.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  final List<String> imagePaths = [
    'images/banner.jpg',
    'images/banner.jpg',
    'images/banner.jpg',
    'images/banner.jpg'
  ];
  late List<Widget> _Pages;

  int _activepage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  // void _displayBottomSheet(BuildContext context){
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (context) =>Container(
  //         height: 500,
  //       )
  //   );
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Pages = List.generate(
        imagePaths.length,
        (index) => ImagesPlace(
              imagePath: imagePaths[index],
            ));
    startTimer();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _timer?.cancel();
  // }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openContacts() async {
    const url = 'content://contacts/people';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'gokul.levitate@gmail.com',
      queryParameters: {'subject': 'Example Subject'},
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool customTileExpanded = false;
    return Scaffold(
      backgroundColor: Color(0xff29695D),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('images/logo.svg'),
                      ],
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 40,
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100)),
                                color: Color(0xffF5F5F5),
                              ),
                              // height: 500,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70, left: 20, right: 50),
                                    child: Container(
                                      width: double.infinity,
                                      height: 30,
                                      //color: Colors.white,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Sreeramachandran ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff29695D),
                                              fontFamily: 'Ubuntu',
                                            ),
                                          ),
                                          Text(
                                            '(He, Him)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Color(0xffA8B6B3),
                                              fontFamily: 'Ubuntu',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ), //name
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 50),
                                    child: Container(
                                      width: double.infinity,
                                      height: 16,
                                      child: Text(
                                        'Co-founder | Chief Design Officer',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA8B6B3),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 50),
                                    child: Container(
                                      width: double.infinity,
                                      height: 16,
                                      child: Text(
                                        'Levitate Studios',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA8B6B3),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 50),
                                    child: Container(
                                      width: double.infinity,
                                      height: 25,
                                      child: Text(
                                        'About Me',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff29695D),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 20, right: 50),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      child: Text(
                                        "Hey, I'm the co-founder and Chief Design\nOfficer at Levitate Studios, shaping awesome\nexperiences for over four years.\nFrom pixels to user smiles, I've got a knack\nfor making things look and feel amazing.\nLet's design the future together! 🎨",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffA8B6B3),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:20,right:10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffEBEEED),
                                              border: Border.all(
                                                color: Color(
                                                    0xffDCE2E1), // Border color
                                                width: 1.0, // Border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // Border radius
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'images/scan.svg'),
                                                TextButton(
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                  ),
                                                  onPressed: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return SingleChildScrollView(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffF5F5F5),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15)),
                                                            ),
                                                            height: 600,
                                                            width:
                                                                double.infinity,
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 32,
                                                                ),
                                                                const Text(
                                                                  'Share QR Code',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xffA8B6B3),
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          40),
                                                                  child:QrImageView(
                                                                    data: 'https://www.google.co.in/',
                                                                    version: QrVersions.auto,
                                                                    size: 200.0,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    height: 50,
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        foregroundColor:
                                                                            Colors
                                                                                .white,
                                                                        backgroundColor:
                                                                            Color(
                                                                                0xff29695D),

                                                                      ),
                                                                      child:
                                                                          const Text(
                                                                        'Share Qr Code',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context); // Close the first bottom sheet
                                                                        showModalBottomSheet<
                                                                            void>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext
                                                                                  context) {
                                                                            return SecondBottomSheet();
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'QrCode',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff29695D),
                                                      fontFamily: 'Ubuntu',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left:10,right:20),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffEBEEED),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: Color(
                                                    0xffDCE2E1), // Border color
                                                width: 1.0, // Border width
                                              ), // Border radius
                                            ),
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'images/share_ico.svg'),
                                                TextButton(
                                                  style: ButtonStyle(
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .transparent),
                                                  ),
                                                  onPressed: () {
                                                    // Close the first bottom sheet
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        //a
                                                        return SingleChildScrollView(
                                                          child: Container(
                                                            height: 500,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffF5F5F5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 32,
                                                                ),
                                                                const Text(
                                                                  'Share a Business Card',
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xffA8B6B3),
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                66,
                                                                            width:
                                                                                66,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xffEBEEED),
                                                                              borderRadius: BorderRadius.circular(50),
                                                                            // Border radius
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: SvgPicture.asset(
                                                                                'images/TwitterLogo.svg',
                                                                                height: 10,
                                                                                width: 10,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            'Twitter',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Ubuntu',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.7,
                                                                              color: Color(0xffAEAEAE),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                66,
                                                                            width:
                                                                                66,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xffEBEEED),
                                                                              borderRadius: BorderRadius.circular(50),
                                                                             // Border radius
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: SvgPicture.asset(
                                                                                'images/FacebookLogo.svg',
                                                                                height: 10,
                                                                                width: 10,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            'Facebook',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Ubuntu',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.7,
                                                                              color: Color(0xffAEAEAE),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                66,
                                                                            width:
                                                                                66,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xffEBEEED),
                                                                              borderRadius: BorderRadius.circular(50),
                                                                             // Border radius
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: SvgPicture.asset(
                                                                                'images/sms1.svg',
                                                                                height: 10,
                                                                                width: 10,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            'Email',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Ubuntu',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.7,
                                                                              color: Color(0xffAEAEAE),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                70,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xffEBEEED),
                                                                              borderRadius: BorderRadius.circular(50),
                                                                              // Border radius
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: SvgPicture.asset(
                                                                                'images/WhatsappLogo.svg',
                                                                                height: 5,
                                                                                width: 5,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                6,
                                                                          ),
                                                                          Text(
                                                                            'WhatsApp',
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Ubuntu',
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12,
                                                                              letterSpacing: 0.7,
                                                                              color: Color(0xffAEAEAE),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),

                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                                                  child: Container(
                                                                    height: 50,
                                                                    width: double.infinity,
                                                                    //
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.white,
                                                                      borderRadius: BorderRadius.all(Radius.circular(50),),
                                                                      border: Border.all(
                                                                        color: Color(0xffE4E4E4),
                                                                        width: 1,
                                                                      )// Set the radius here
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(left: 40),
                                                                          child: Text("https://sriram//profile"),
                                                                        ),
                                                                        Container(
                                                                          height: 50,
                                                                          width: 80,
                                                                          decoration: BoxDecoration(
                                                                            color: Color(0xff29695D),
                                                                            borderRadius: BorderRadius.horizontal(right: Radius.circular(50)), // Set the radius here
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: SvgPicture.asset('images/copy.svg'),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ),
                                                                ),

                                                                SizedBox(
                                                                  height: 50,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left:20,right:20),
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    height: 50,
                                                                    child: ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        foregroundColor:
                                                                            Colors
                                                                                .white,
                                                                        backgroundColor:
                                                                            Color(
                                                                                0xff29695D),
                                                                      ),
                                                                      child:
                                                                          const Text(
                                                                        'Share',
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                        ),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context); // Close the first bottom sheet
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'Share',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff29695D),
                                                      fontFamily: 'Ubuntu',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffEBEEED),
                                        border: Border.all(
                                          color:
                                              Color(0xffDCE2E1), // Border color
                                          width: 1.0, // Border width
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        // Border radius
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'images/document.svg'),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'View Portfolio',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff29695D),
                                                fontFamily: 'Ubuntu',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        'Social media links(Levitate)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                          letterSpacing: 0.5,
                                          color: Color(0xff33423F),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://www.instagram.com/'),
                                              child: SvgPicture.asset(
                                                'images/InstagramLogo.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://www.behance.net/'),
                                              child: SvgPicture.asset(
                                                  'images/BehanceLogo.svg'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://in.linkedin.com/'),
                                              child: SvgPicture.asset(
                                                  'images/LinkedinLogo.svg'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://dribbble.com/following'),
                                              child: SvgPicture.asset(
                                                  'images/DribbbleLogo.svg'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                         left: 20, right: 20),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        'Social media links (Personal)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                          letterSpacing: 0.5,
                                          color: Color(0xff33423F),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                 
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://www.instagram.com/'),
                                              child: SvgPicture.asset(
                                                'images/InstagramLogo.svg',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://www.behance.net/'),
                                              child: SvgPicture.asset(
                                                  'images/BehanceLogo.svg'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://in.linkedin.com/'),
                                              child: SvgPicture.asset(
                                                  'images/LinkedinLogo.svg'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEEED),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(
                                                  0xffDCE2E1), // Border color
                                              width: 1.0, // Border width
                                            ), // Border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                              ),
                                              onPressed: () => _launchURL(
                                                  'https://dribbble.com/following'),
                                              child: SvgPicture.asset(
                                                  'images/DribbbleLogo.svg'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        'Contact',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5,
                                          color: Color(0xff33423F),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(12),
                                                topLeft: Radius.circular(12)),
                                            color: Color(0xffFFFFFF),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Work",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffA8B6B3),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        '+91 7418 932 507',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          letterSpacing: 0.7,
                                                          color:
                                                              Color(0xff29695D),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffDCE2E1),
                                                        width: 1,
                                                      ),
                                                      color: Color(0xffEBEEED),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: _openContacts,
                                                      child: SvgPicture.asset(
                                                          'images/call.svg'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Container(
                                          height: 90,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                            color: Color(0xffFFFFFF),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Personal",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffA8B6B3),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        '+91 6381 762 099',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          letterSpacing: 0.7,
                                                          color:
                                                              Color(0xff29695D),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffDCE2E1),
                                                        width: 1,
                                                      ),
                                                      color: Color(0xffEBEEED),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: _openContacts,
                                                      child: SvgPicture.asset(
                                                          'images/call.svg'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 90,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            color: Color(0xffFFFFFF),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Work",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffA8B6B3),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        'Sree@levitatestudios.in',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          letterSpacing: 0.7,
                                                          color:
                                                              Color(0xff29695D),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffDCE2E1),
                                                        width: 1,
                                                      ),
                                                      color: Color(0xffEBEEED),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: _openEmail,
                                                      child: SvgPicture.asset(
                                                          'images/sms.svg'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 90,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            color: Color(0xffFFFFFF),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Website",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffA8B6B3),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        'levitatestudios.in',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          letterSpacing: 0.7,
                                                          color:
                                                              Color(0xff29695D),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffDCE2E1),
                                                        width: 1,
                                                      ),
                                                      color: Color(0xffEBEEED),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () => _launchURL(
                                                          "https://levitatestudios.in/"),
                                                      child: SvgPicture.asset(
                                                          'images/global.svg'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 120,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            color: Color(0xffFFFFFF),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(11),
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Location",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0xffA8B6B3),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        '3, Vathiar street,\nKaruvadikuppam,Lawspet,\nPuducherry, 605008',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          letterSpacing: 0.7,
                                                          color:
                                                              Color(0xff29695D),
                                                          fontFamily: 'Ubuntu',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xffDCE2E1),
                                                        width: 1,
                                                      ),
                                                      color: Color(0xffEBEEED),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () => _launchURL(
                                                          "https://www.google.com/maps/place/Levitate+Studios/@11.960875,79.822789,15z/data=!4m6!3m5!1s0x3a5361d500ab39a3:0x528a9b6c6e60d8a7!8m2!3d11.9608747!4d79.8227888!16s%2Fg%2F11tf3nymch?hl=en&entry=ttu"),
                                                      child: SvgPicture.asset(
                                                          'images/location.svg'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), //Contact
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Divider(
                                      color: Color(0xffDCE2E1),
                                      thickness: 1,
                                    ),
                                  ),

                                  
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        'Forms',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5,
                                          color: Color(0xff33423F),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xff29695D),
                                          // padding: EdgeInsets.only(left:90,right:90)
                                        ),
                                        child: const Text(
                                          'Job Application Form',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 15,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => NextPage()),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xff29695D),
                                          // padding: EdgeInsets.only(left:90,right:90)
                                        ),
                                        child: const Text(
                                          'Brand Questionnaire Form',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Ubuntu',
                                            fontSize: 15,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(builder: (context) => NextPage()),
                                          // );
                                        },
                                      ),
                                    ),
                                  ),
                                 
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 20, right: 20),
                                    child: Container(
                                      height: 20,
                                      width: double.infinity,
                                      child: Text(
                                        'Our Services',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5,
                                          color: Color(0xff33423F),
                                          fontFamily: 'Ubuntu',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Container(
                                          //height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD1E6D8),
                                            // border: Border.all(color: Color(0xffD1E6D8)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                setState(() =>
                                                    _isExpanded = expanded);
                                              },
                                              trailing: SvgPicture.asset(
                                                _isExpanded
                                                    ? 'images/arrow-up.svg'
                                                    : 'images/arrow-down.svg',
                                                color: Color(0xff29695D),
                                              ),
                                              title: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Graphic Design',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    color: Color(0xff29695D),
                                                    letterSpacing: 0.7,
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                              ),
                                              children: [
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xffA6CDB2),
                                                ),
                                                ListTile(
                                                  title: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Our graphic design services are\ncustomised to meet customer needs\nand preferences, whether you're\nlooking for a captivating logo or a\ncreative package",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff29695D),
                                                        letterSpacing: 0.7,
                                                        fontFamily: 'Ubuntu',
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        'For More Visit our Website',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff29695D),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          fontFamily: 'Ubuntu',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Container(
                                          //height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD1E6D8),
                                            // border: Border.all(color: Color(0xffD1E6D8)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              trailing: SvgPicture.asset(
                                                _isExpanded
                                                    ? 'images/arrow-up.svg'
                                                    : 'images/arrow-down.svg',
                                                color: Color(0xff29695D),
                                              ),
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                setState(() =>
                                                    _isExpanded = expanded);
                                              },
                                              title: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'UIUX Design',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xff29695D),
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                              ),
                                              children: [
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xffA6CDB2),
                                                ),
                                                ListTile(
                                                  title: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Our graphic design services are\ncustomised to meet customer needs\nand preferences, whether you're\nlooking for a captivating logo or a\ncreative package",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff29695D),
                                                        letterSpacing: 0.7,
                                                        fontFamily: 'Ubuntu',
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        'For More Visit our Website',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff29695D),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          fontFamily: 'Ubuntu',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Container(
                                          //height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD1E6D8),
                                            // border: Border.all(color: Color(0xffD1E6D8)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              trailing: SvgPicture.asset(
                                                _isExpanded
                                                    ? 'images/arrow-up.svg'
                                                    : 'images/arrow-down.svg',
                                                color: Color(0xff29695D),
                                              ),
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                setState(() =>
                                                    _isExpanded = expanded);
                                              },
                                              title: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Application Development',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xff29695D),
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                              ),
                                              children: [
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xffA6CDB2),
                                                ),
                                                ListTile(
                                                  title: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Our graphic design services are\ncustomised to meet customer needs\nand preferences, whether you're\nlooking for a captivating logo or a\ncreative package",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff29695D),
                                                        letterSpacing: 0.7,
                                                        fontFamily: 'Ubuntu',
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        'For More Visit our Website',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff29695D),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          fontFamily: 'Ubuntu',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Container(
                                          //height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD1E6D8),
                                            // border: Border.all(color: Color(0xffD1E6D8)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              trailing: SvgPicture.asset(
                                                _isExpanded
                                                    ? 'images/arrow-up.svg'
                                                    : 'images/arrow-down.svg',
                                                color: Color(0xff29695D),
                                              ),
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                setState(() =>
                                                    _isExpanded = expanded);
                                              },
                                              title: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Artworks',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xff29695D),
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                              ),
                                              children: [
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xffA6CDB2),
                                                ),
                                                ListTile(
                                                  title: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Our graphic design services are\ncustomised to meet customer needs\nand preferences, whether you're\nlooking for a captivating logo or a\ncreative package",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff29695D),
                                                        letterSpacing: 0.7,
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        'For More Visit our Website',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff29695D),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          fontFamily: 'Ubuntu',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Container(
                                          //height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xffD1E6D8),
                                            // border: Border.all(color: Color(0xffD1E6D8)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                              trailing: SvgPicture.asset(
                                                _isExpanded
                                                    ? 'images/arrow-up.svg'
                                                    : 'images/arrow-down.svg',
                                                color: Color(0xff29695D),
                                              ),
                                              onExpansionChanged:
                                                  (bool expanded) {
                                                setState(() =>
                                                    _isExpanded = expanded);
                                              },
                                              title: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Animation',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xff29695D),
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                              ),
                                              children: [
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xffA6CDB2),
                                                ),
                                                ListTile(
                                                  title: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      "Our graphic design services are\ncustomised to meet customer needs\nand preferences, whether you're\nlooking for a captivating logo or a\ncreative package",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff29695D),
                                                        letterSpacing: 0.7,
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: GestureDetector(
                                                      onTap: () => _launchURL(
                                                          'https://in.linkedin.com/'),
                                                      child: Text(
                                                        'For More Visit our Website',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff29695D),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          fontFamily: 'Ubuntu',
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ), //services
                                 
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Divider(
                                      color: Color(0xffDCE2E1),
                                      thickness: 1,
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: PageView.builder(
                                                controller: _pageController,
                                                itemCount: imagePaths.length,
                                                onPageChanged: (value) {
                                                  setState(() {
                                                    _activepage = value;
                                                  });
                                                },
                                                itemBuilder: (context, index) {
                                                  return _Pages[index];
                                                }),
                                          ),
                                          Positioned(
                                            bottom: 3,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List<Widget>.generate(
                                                  _Pages.length,
                                                  (index) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _pageController
                                                            .animateToPage(
                                                                index,
                                                                duration: Duration(
                                                                    microseconds:
                                                                        300),
                                                                curve: Curves
                                                                    .easeIn);
                                                      },
                                                      child: CircleAvatar(
                                                        radius: 4,
                                                        backgroundColor:
                                                            _activepage == index
                                                                ? Color(
                                                                    0xff29695D)
                                                                : Color(
                                                                    0xffA4BDB8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 70,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'images/copyright.svg',
                                              color: Color(0xff29695D)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '2023 www.levitatestudios.in',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              letterSpacing: 0.7,
                                              color: Color(0xff29695D),
                                              fontFamily: 'Ubuntu',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                    color: Color(0xff29695D),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                child: CircleAvatar(
                                  radius: 50,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesPlace extends StatelessWidget {
  final String? imagePath;
  const ImagesPlace({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(90)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          imagePath!,
        ),
      ),
    );
  }
}

class SecondBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          const Text(
            'Share QR Code',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xffA8B6B3),
              fontFamily: 'Ubuntu',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        color: Color(0xffEBEEED),
                        borderRadius: BorderRadius.circular(50),
                       // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'images/TwitterLogo.svg',
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Twitter',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.7,
                        color: Color(0xffAEAEAE),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        color: Color(0xffEBEEED),
                        borderRadius: BorderRadius.circular(50),
                        // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'images/FacebookLogo.svg',
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Facebook',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.7,
                        color: Color(0xffAEAEAE),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        color: Color(0xffEBEEED),
                        borderRadius: BorderRadius.circular(50),
                      // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'images/sms1.svg',
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.7,
                        color: Color(0xffAEAEAE),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Color(0xffEBEEED),
                        borderRadius: BorderRadius.circular(50),
                        // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          'images/WhatsappLogo.svg',
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'WhatsApp',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.7,
                        color: Color(0xffAEAEAE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right: 20), //abgir
            child: Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff29695D),
                  //padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                ),
                child: const Text(
                  'Share',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class sharBottomSheet extends StatelessWidget {
//   const sharBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         height: 500,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Color(0xffF5F5F5),
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15),
//             topLeft: Radius.circular(15),
//           ),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 32,
//             ),
//             const Text(
//               'Share QR Code',
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xffA8B6B3),
//                 fontFamily: 'Ubuntu',
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: 66,
//                         width: 66,
//                         decoration: BoxDecoration(
//                           color: Color(0xffEBEEED),
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: Color(0xffDCE2E1), // Border color
//                             width: 1.0, // Border width
//                           ), // Border radius
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: SvgPicture.asset(
//                             'images/TwitterLogo.svg',
//                             height: 10,
//                             width: 10,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 6,
//                       ),
//                       Text(
//                         'Twitter',
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                           letterSpacing: 0.7,
//                           color: Color(0xffAEAEAE),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 66,
//                         width: 66,
//                         decoration: BoxDecoration(
//                           color: Color(0xffEBEEED),
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: Color(0xffDCE2E1), // Border color
//                             width: 1.0, // Border width
//                           ), // Border radius
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: SvgPicture.asset(
//                             'images/FacebookLogo.svg',
//                             height: 10,
//                             width: 10,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 6,
//                       ),
//                       Text(
//                         'Facebook',
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                           letterSpacing: 0.7,
//                           color: Color(0xffAEAEAE),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 66,
//                         width: 66,
//                         decoration: BoxDecoration(
//                           color: Color(0xffEBEEED),
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: Color(0xffDCE2E1), // Border color
//                             width: 1.0, // Border width
//                           ), // Border radius
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: SvgPicture.asset(
//                             'images/sms1.svg',
//                             height: 10,
//                             width: 10,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 6,
//                       ),
//                       Text(
//                         'Email',
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                           letterSpacing: 0.7,
//                           color: Color(0xffAEAEAE),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         height: 70,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           color: Color(0xffEBEEED),
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: Color(0xffDCE2E1), // Border color
//                             width: 1.0, // Border width
//                           ), // Border radius
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15),
//                           child: SvgPicture.asset(
//                             'images/WhatsappLogo.svg',
//                             height: 5,
//                             width: 5,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 6,
//                       ),
//                       Text(
//                         'WhatsApp',
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12,
//                           letterSpacing: 0.7,
//                           color: Color(0xffAEAEAE),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30,),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50,right: 50),
//                   child: Container(
//                     height: 60,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                       borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50),),
//                       border: Border.all(
//                         color: Color(0xffE4E4E4),
//                         width: 1,
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 50),
//                             child: Expanded(
//                               //height: 60,
//                               //color: Colors.red,
//                               child: Text('https://sriram//profile',style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15,
//                                 letterSpacing: 0.7,
//
//                               ),),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 60,
//                           width: 80,
//                           decoration: BoxDecoration(
//                               color: Color(0xff29695D),
//                               borderRadius: BorderRadius.horizontal(right: Radius.circular(50),),
//                           ),
//
//                           child: Padding(
//                             padding: const EdgeInsets.all(10),
//                             child: SvgPicture.asset('images/copy.svg'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Color(0xff29695D),
//                 padding: EdgeInsets.only(left: 185,right: 185,top: 30,bottom: 30),
//               ),
//               child: const Text(
//                 'Share',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'Ubuntu',
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.pop(context); // Close the first bottom sheet
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
