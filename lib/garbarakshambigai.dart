import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';

class Garbarakshambigai extends StatefulWidget {
  const Garbarakshambigai({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GarbarakshambigaiState createState() => _GarbarakshambigaiState();
}

class _GarbarakshambigaiState extends State<Garbarakshambigai> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        appBar: AppBar(
          title: Text(
            'கர்ப்ப ரக்க்ஷாம்பிகை அம்மன் துணை',
            style: TextStyle(
              fontFamily: 'meera',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          toolbarHeight: 60,
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actionsIconTheme: const IconThemeData(
            size: 40.0,
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          elevation: 4.0,
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  AudioPlayer player = AudioPlayer();
  bool _isStopped = false;
  bool _isFirstLine = false;
  bool _isSecondLine = false;
  bool _isThirdLine = false;
  bool _isFourthLine = false;

  bool _isStartClick = false;
  bool _isEnabled = false;
  int _isSlogan = 0;

  _playManthiram() async {
    setState(() {
      _isStopped = true;
    });

    await player.play(AssetSource('music/himavath_uttare_slogam.mp3'));
    await Future.delayed(const Duration(milliseconds: 34000), () {
      setState(() {
        player.stop();
        _isStopped = false;
      });
    });
  }

  _linesAppear() {
    _isStartClick = true;
    if (_isEnabled == true && _isSlogan < 108) {
      setState(() {
        _isFirstLine = false;
        _isSecondLine = false;
        _isThirdLine = false;
        _isFourthLine = false;
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        if (_isFirstLine == false) {
          setState(() {
            _isFirstLine = true;
            _isEnabled = false;
            _isSlogan = _isSlogan + 1;
          });
        }
      });
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (_isFirstLine == true && _isSecondLine == false) {
          setState(() {
            _isSecondLine = true;
          });
        }
      });
      Future.delayed(const Duration(milliseconds: 2400), () {
        if (_isFirstLine == true &&
            _isSecondLine == true &&
            _isThirdLine == false) {
          setState(() {
            _isThirdLine = true;
          });
        }
      });

      Future.delayed(const Duration(milliseconds: 3600), () {
        if (_isFirstLine == true &&
            _isSecondLine == true &&
            _isThirdLine == true &&
            _isFourthLine == false) {
          setState(() {
            _isFourthLine = true;
            _isEnabled = true;
          });
        }
      });
    } else {
      setState(() {
        _isFirstLine = false;
        _isSecondLine = false;
        _isThirdLine = false;
        _isFourthLine = false;
        _isEnabled = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);
    _isEnabled = true;
    _isStartClick = false;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        backgroundColor: Colors.lightGreen.shade50,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 0.01.sh,
                ),
                Text(
                  'சுகப் பிரசவம் அருளும்',
                  style: TextStyle(
                    fontFamily: 'meera',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Text('கர்ப்ப ரக்க்ஷாம்பிகை',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    )),
                Text('அம்மன் சுலோகம்',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    )),
                SizedBox(
                  height: 0.01.sh,
                ),
                Text(
                  'கர்ப்பிணிப் பெண்ணும், அவருக்காகப் பிறரும்',
                  style: TextStyle(
                    fontFamily: 'meera',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                ),
                Text(
                  '108 முறை பாராயணம் செய்யவும்',
                  style: TextStyle(
                    fontFamily: 'meera',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                  child: Container(
                    color: Colors.black38,
                    // Color of the line
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('உச்சரிப்பை உறுதி செய்ய ',
                        style: TextStyle(
                          fontFamily: 'meera',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade600,
                        )),
                    IconButton(
                      iconSize: 40,
                      onPressed: _isStopped
                          ? null
                          : () {
                              _playManthiram();
                            },
                      color: _isStopped ? Colors.black12 : Colors.black,
                      icon: const Icon(Icons.volume_up),
                    ),
                  ],
                ),
                SizedBox(
                    height: 1.0, // Height of the line
                    child: Container(
                      color: Colors.black38, // Color of the line
                    )),
                Expanded(
                  child: Image(
                      image: AssetImage(
                          "assets/images/garbaratchambigai_second_page.webp"),
                      fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                Text('ஹிமவத் யுத்தரே பார்ஸ்வே',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _isFirstLine ? Colors.deepPurple : Colors.black12,
                    ),
                    textAlign: TextAlign.center),
                Text('ஸூரதா நாம யக்ஷிணீ ! ',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _isSecondLine ? Colors.deepPurple : Colors.black12,
                    ),
                    textAlign: TextAlign.center),
                Text('தஸ்யா: ஸ்மரண மாத்ரேண',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _isThirdLine ? Colors.deepPurple : Colors.black12,
                    ),
                    textAlign: TextAlign.center),
                Text('விஸல்யா கர்ப்பிணீ  பவேது',
                    style: TextStyle(
                      fontFamily: 'meera',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: _isFourthLine ? Colors.deepPurple : Colors.black12,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 0.01.sh,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _isStartClick
                          ? SizedBox(
                              width: 0.32.sw,
                            )
                          : SizedBox(
                              width: 0.32.sw,
                              child: Text('பாராயணம்\nதொடங்க   ',
                                  style: TextStyle(
                                    fontFamily: 'meera',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                      GestureDetector(
                          onTap: _isEnabled
                              ? () {
                                  _linesAppear();
                                }
                              : null,
                          child: Container(
                              alignment: Alignment.center,
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: !(_isFirstLine && _isEnabled)
                                    ? Colors.transparent
                                    : Colors.brown.shade400,
                              ),
                              child: Text(_isSlogan.toString(),
                                  style: TextStyle(
                                      fontSize: 14.0.sp,
                                      color: !(_isFirstLine && _isEnabled)
                                          ? Colors.brown.shade400
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'nunito')))),
                      _isStartClick
                          ? SizedBox(
                              width: 0.32.sw,
                            )
                          : SizedBox(
                              width: 0.32.sw,
                              child: Text('நடுவில்\nதட்டவும்',
                                  style: TextStyle(
                                    fontFamily: 'meera',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                    ]),
                SizedBox(
                  height: 0.05.sh,
                ),
              ]),
        ));
  }
}
