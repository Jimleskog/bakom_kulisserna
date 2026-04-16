import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import '../jane/colors.dart';
import '../jane/fashionwidgets.dart';
import '../jane/realitywidgets.dart';
import '../main.dart';
import '../widgets/widgets.dart';

class BakomKulissernaMainPage extends StatefulWidget {
  const BakomKulissernaMainPage({super.key});

  @override
  BakomKulissernaMainPageState createState() => BakomKulissernaMainPageState();
}

class BakomKulissernaMainPageState extends State<BakomKulissernaMainPage>
    with SingleTickerProviderStateMixin {
  bool showReality = false;
  late final AnimationController _animationController;
  late final Animation<double> _flipAnimation;
  late final PageController _bannerController;
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the page flip animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _flipAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

    // Initialize banner controller and auto-scroll timer
    _bannerController = PageController(initialPage: 0);
    // Removed invalid line

    _startAutoScroll();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _bannerController.dispose();
    _bannerTimer?.cancel();
    super.dispose();
  }

  void toggleReality() {
    if (showReality) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      showReality = !showReality;
    });
  }

  // Start a smooth, continuous auto-scroll effect
  void _startAutoScroll() async {
    const double scrollSpeed = 1000; // Adjust speed for smoothness
    const Duration scrollDuration =
        Duration(seconds: 20); // Adjust duration for scroll speed
    // _bannerTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    while (true) {
      debugPrint('looop call');
      if (_bannerController.hasClients) {
        debugPrint('Scrolling banner');
        await _bannerController.animateTo(
          _bannerController.offset + scrollSpeed,
          duration: scrollDuration,
          curve: Curves.linear,
        );

        // Loop the banner when reaching the end
        if (_bannerController.position.pixels >=
            _bannerController.position.maxScrollExtent) {
          _bannerController.jumpTo(0.0);
        }
      } else {
        debugPrint('Banner controller not ready');
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    // });
  }

  void _showInfoPopup() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              right: 16,
              bottom: 80,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () => Navigator.of(context).pop(),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            height: 1.5,
                            fontFamily: 'Roboto',
                          ),
                          children: [
                            const TextSpan(
                              text: 'Bakom Kulisserna ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text:
                                  'är ett interaktivt utbildningskoncept som synliggör klädkonsumtionens baksidor för unga.\n\n',
                            ),
                            const TextSpan(
                              text:
                                  'Är du intresserad av att använda, sprida eller vidareutveckla konceptet?\n\n',
                            ),
                            const TextSpan(
                              text: 'Mejla gärna: ',
                            ),
                            TextSpan(
                              text: 'studio@createika.com',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  try {
                                    final emailUri = Uri.parse(
                                        'mailto:studio@createika.com?subject=Bakom%20Kulisserna');
                                    await launchUrl(emailUri, mode: LaunchMode.platformDefault);
                                  } catch (e) {
                                    debugPrint('Could not launch email: $e');
                                  }
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('TextTheme: ${Theme.of(context).textTheme}');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        title: Row(
          children: [
            Text(
              showReality ? 'BAKOM KULISSERNA' : 'FRAMFÖR KULISSERNA',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                // letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(222, 219, 213, 100),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            padding: EdgeInsets.zero, // Set padding to zero
            iconSize: 24, // Increased icon size
            icon: const Icon(Icons.visibility),
            onPressed: toggleReality,
            tooltip: showReality ? 'Switch to Store View' : 'Reveal Reality',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: showReality
          ? FloatingActionButton(
              onPressed: _showInfoPopup,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 4,
              child: const Text(
                '?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final isMobile =
              MediaQuery.of(context).size.width < desktopToMobileWidth;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective effect
              ..rotateY(pi * _flipAnimation.value),
            alignment: Alignment.center,
            child: _flipAnimation.value < 0.5
                ? buildPage(
                    fashionWidgets(_bannerController, context, isMobile))
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: buildPage(
                      buildRealityWidgets(_bannerController, context, isMobile),
                    )),
          );
        },
      ),
    );
  }
}
