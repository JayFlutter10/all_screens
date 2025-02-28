import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicatorView extends StatefulWidget {
   double? radius;
   Color? color;
   bool? animated;
   AnimatedCircularProgressIndicatorView({super.key,  this.radius,this.color,this.animated,});

  @override
  State<AnimatedCircularProgressIndicatorView> createState() => _AnimatedCircularProgressIndicatorViewState();
}

class _AnimatedCircularProgressIndicatorViewState extends State<AnimatedCircularProgressIndicatorView> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:  CupertinoActivityIndicator(
            animating: widget.animated??true,
              radius: widget.radius??height*0.02,
            color: widget.color??Colors.blue.shade900,
          ),
        ),
    );
  }
}
