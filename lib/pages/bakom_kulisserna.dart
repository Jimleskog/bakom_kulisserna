import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../jane/fashionwidgets.dart';
import '../jane/realitywidgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bakom Kulisserna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: toggleReality,
            tooltip: showReality ? 'Switch to Store View' : 'Reveal Reality',
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective effect
              ..rotateY(pi * _flipAnimation.value),
            alignment: Alignment.center,
            child: _flipAnimation.value < 0.5
                ? buildPage(fashionWidgets(_bannerController))
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: buildPage(
                      buildRealityWidgets(_bannerController),
                    )),
          );
        },
      ),
    );
  }
}
