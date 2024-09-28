import 'dart:math';

import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({
    super.key,
  });

  @override
  _HeartAnimationState createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with TickerProviderStateMixin {
  // late AnimationController _controller;

  final List<_AnimationItem> _animationItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of all animation controllers when the widget is disposed.
    for (var item in _animationItems) {
      item.controller.dispose();
    }
    super.dispose();
  }

  void _addAnimationItem() {
    final animationItem = _AnimationItem(
      controller: AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      ),
      offset: Offset(
        Random().nextDouble() * 4 - 2, // Random horizontal offset
        Random().nextDouble() * 4 - 2, // Random vertical offset
      ),
    );

    // Declare the listener variable
    late AnimationStatusListener listener;

    // Assign the function to the listener variable
    listener = (status) {
      if (status == AnimationStatus.completed) {
        // Remove the listener before disposing the controller
        animationItem.controller.removeStatusListener(listener);
        _removeAnimationItem(animationItem);
      }
    };
    animationItem.controller.forward();

    animationItem.controller.addStatusListener(listener);

    setState(() {
      _animationItems.add(animationItem);
      _iconColor = Colors.red;
      _presses++;
      if (_presses > pressGoal) {
        sendHeartRequest();
      }
    });
  }

  final int pressGoal = 100;

  Future<void> sendHeartRequest() async {
    // if (true) {
    //   sendEmailWidgetWithParameters(
    //       subject: 'Heart',
    //       recipients: ['dev@hitchapp.se'],
    //       body: ltext().heartMsg2(pressGoal),
    //       theme: ltext().love,
    //       textinputhint: ltext().suggestion);
    // } else {
    //   bool? sendThing = await showConfirmationDialog(
    //       'You pressed $pressGoal times', 'Choose your price',
    //       dismissable: false);
    //   if (sendThing != null && sendThing) {
    //     printme('You pressed 100 times');
    //   }
    // }
  }

  void _removeAnimationItem(_AnimationItem? itemToRemove) {
    if (itemToRemove != null) {
      itemToRemove.controller.dispose();
      setState(() {
        _animationItems.remove(itemToRemove);
      });
      if (_animationItems.isEmpty) {
        _iconColor = Colors.grey;
      }
    }
  }

  int _presses = 0;
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._animationItems.map((item) {
          return AnimatedHeart(
            offset: item.offset,
            controller: item.controller,
          );
        }),
        IconButton(
          // highlightColor: Colors.red,
          onPressed: _addAnimationItem,
          icon: _animationItems.isEmpty
              ? const Icon(
                  Icons.favorite_border,
                )
              : const Icon(
                  Icons.favorite,
                ),
          color: _iconColor,
        ),
      ],
    );
  }
}

class AnimatedHeart extends StatelessWidget {
  final AnimationController controller;
  final Animation<Offset> positionAnimation;
  final Animation<double> scaleAnimation;
  final Offset offset;

  AnimatedHeart({
    super.key,
    required this.controller,
    required this.offset,
  })  : positionAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.0),
          end: offset,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut, // Adjust the curve as needed
          ),
        ),
        scaleAnimation = Tween<double>(
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ));

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: SlideTransition(
        position: positionAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: const Icon(
            Icons.favorite,
            size: 48.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class _AnimationItem {
  final AnimationController controller;
  final Offset offset;

  _AnimationItem({
    required this.controller,
    required this.offset,
  });
}
