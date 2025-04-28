import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_update/in_app_update.dart';
import 'garbarakshambigai.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  bool _isVisible = false;
  bool _templeView = false;

  void _checkForUpdate() async {
    AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      InAppUpdate.performImmediateUpdate();
    }
  }

  void _loadBannerAd() async {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7346088169082906/2271615820',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void _temple() {
    if (_templeView == false) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _templeView = true;
        });
      });
    }
  }

  void _showButton() async {
    await Future.delayed(const Duration(seconds: 8)); // Delay for 3 seconds
    setState(() {
      _isVisible = true;
    });
  }

  @override
  void initState() {
    _temple();
    _checkForUpdate();
    _loadBannerAd();
    _showButton();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: MediaQuery.of(context).size,
        minTextAdapt: true,
        builder: (BuildContext context, child) => MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.yellow.shade400,
              appBar: AppBar(
                title: Text(
                  'கர்ப்ப ரக்க்ஷாம்பிகை அம்மன் துணை',
                  style: TextStyle(
                    fontFamily: 'meera',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
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
              body: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 2.0),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Text('சுகப் பிரசவம் அருளும்',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: .002.sh,
                        ),
                        Text('கர்ப்ப ரக்க்ஷாம்பிகை',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: .002.sh,
                        ),
                        Text('அம்மன் சுலோகம்',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        AnimatedContainer(
                          padding: const EdgeInsets.all(6.0),
                          height: _templeView ? 0.35.sh : 0.1.sh,
                          duration: const Duration(milliseconds: 1200),
                          child: Image(
                              image: AssetImage(
                                  "assets/images/thirukkarukavur_temple.webp"),
                              fit: BoxFit.contain),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Text('அருள்மிகு கர்ப்ப ரக்க்ஷாம்பிகை அம்மன்',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: 0.002.sh,
                        ),
                        Text('உடனுறை முல்லைவனநாதர் திருக்கோயில்',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: 0.002.sh,
                        ),
                        Text('திருக்கருகாவூர் - 614302',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: 0.002.sh,
                        ),
                        Text('கைபேசி: 08870058269',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        Text('மின்னஞ்சல்: ',
                            style: TextStyle(
                              fontFamily: 'meera',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        Text('eomullaivananathartkr@gmail.com',
                            style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            )),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Garbarakshambigai()),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: _isVisible
                                  ? Color.fromARGB(255, 128, 0, 0)
                                  : Colors.yellow.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              elevation: 3,
                              textStyle: TextStyle(
                                fontFamily: 'meera',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              )),
                          child: Text(_isVisible ? 'சுலோகம் தொடங்க' : ''),
                        ),
                        SizedBox(height: 0.01.sh),
                        Container(
                            child: (_isAdLoaded && _bannerAd != null)
                                ? Container(
                                    alignment: Alignment.center,
                                    height: _bannerAd!.size.height.toDouble(),
                                    width: _bannerAd!.size.width.toDouble(),
                                    child: AdWidget(ad: _bannerAd!),
                                  )
                                : Container()),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
