import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_bizbooster/constants/widgets/custom_container.dart';

class AnimatedCircularProgressIndicatorView extends StatefulWidget {
   double? radius;
   Color? color;
   Color? borderColor;
   bool? animated;
   Color? backgroundColor;
   double? dynamicVerticalPadding;
   double? dynamicHorizontalPadding;
   AnimatedCircularProgressIndicatorView({super.key,  this.radius,this.color,this.borderColor,this.animated,this.backgroundColor,this.dynamicHorizontalPadding,this.dynamicVerticalPadding});

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
        child: customContainer(
          containerColor: widget.backgroundColor??Colors.white,
          bRadius:width*0.02,
          borderColor: widget.borderColor??Color.fromRGBO(0, 80, 157, 1),
          vPadding: widget.dynamicVerticalPadding??height*0.02,
          hPadding: widget.dynamicVerticalPadding??width*0.05,
          child: CupertinoActivityIndicator(
            animating: widget.animated??true,
              radius: widget.radius??15,
            color: widget.color??Color.fromRGBO(0, 80, 157, 1),
          ),
        ),
      ),
    );
  }
}
