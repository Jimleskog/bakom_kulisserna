import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../jannika/fashionwidgets.dart';
import '../jannika/realitywidgets.dart';
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
      curve: Curves.easeInOut,
    ));

    // Initialize banner controller and auto-scroll timer
    _bannerController = PageController(initialPage: 0);
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
  void _startAutoScroll() {
    const double scrollSpeed = 2.0; // Adjust speed for smoothness
    _bannerTimer =
        Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
      if (_bannerController.hasClients) {
        _bannerController.jumpTo(_bannerController.offset + scrollSpeed);

        // Loop the banner when reaching the end
        if (_bannerController.position.pixels >=
            _bannerController.position.maxScrollExtent) {
          _bannerController.jumpTo(0.0);
        }
      }
    });
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
