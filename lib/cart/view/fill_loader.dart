import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class FillLoader extends StatefulWidget {
  const FillLoader({super.key});

  @override
  State<FillLoader> createState() => _FillLoaderState();
}

class _FillLoaderState extends State<FillLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<int> _percentageAnimation;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animation for circle radius (from 0.3 to 0.45)
    _radiusAnimation = Tween<double>(begin: 0.3, end: 0.45).animate(_controller);

    // Animation for percentage text (from 0 to 100)
    _percentageAnimation = IntTween(begin: 0, end: 100).animate(_controller);

    // Add listener to trigger rebuild when animation value changes
    _controller.addListener(() {
      setState(() {});
    });

    // Add status listener to detect when animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isCompleted = true;
        });
      }
    });

    // Start the animation when widget is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: CupertinoNavigationBar(),
      body: Stack(
          children: [
            // Circle to be enlarged with animation
            _circularColorContainer(
                radius: width * _radiusAnimation.value,
                color: const Color.fromRGBO(131, 212, 117, 1)
            ),

            _circularColorContainer(
                radius: width * 0.2,
                color: const Color.fromRGBO(87, 200, 77, 1)
            ),

            _circularColorContainer(
                radius: width * 0.1,
                color: Colors.green
            ),

            Center(
              child: _isCompleted
                  ? const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 50,
              )
                  : Text(
                '${_percentageAnimation.value}%',
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
    );
  }
}

Widget _circularColorContainer({required double radius, required Color color}) {
  return Center(child: CircleAvatar(backgroundColor: color, radius: radius));
}